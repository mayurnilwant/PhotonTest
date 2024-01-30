//
//  HttpHandler.swift
//  PhotonTest
//
//  Created by Mayur Nilwant on 30/01/2024.
//

import Foundation



enum HttpOperationType {
    
    case get
    case post(Decodable)
    
    func getMethodType () -> String {
        
        switch self {
        case .get:
            "GET"
        case .post(let decodable):
            "POST"
        }
    }
}

protocol EndPoint {
    
    var schene: String {get}
    var host: String {get}
    var queries: [String: String]? {get set}
    var path:String?{get}
    var httpOperation: HttpOperationType {get set}
    
    init()
    init(withQery query: [String: String]?, andHttpOperation operation: HttpOperationType)
        
}

extension EndPoint {
    
    init(withQery query: [String: String]?, andHttpOperation operation: HttpOperationType) {
        
        self.init()
        self.queries = query
        self.httpOperation = operation
    }
    
    
    var url: URL? {
        
        var urlComponent = URLComponents()
        
        urlComponent.scheme = self.schene
        urlComponent.host = self.host
        urlComponent.path = path ?? ""
        
        if let _query = self.queries {
            
            urlComponent.queryItems = _query.map({ name, value in
                
                return  URLQueryItem(name: name, value: value)
            })
            
        }
            let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json")
        return url
        
    }
}

struct SchoolResourceEndPoint: EndPoint {
   
    
    init() {
        self.httpOperation = .get
    }
    var httpOperation: HttpOperationType
    var schene: String {
        
        return "https"
    }
    
    var host: String {
        
        return "data.cityofnewyork.us/resource"
    }
    
    var queries: [String : String]?
    
    var path: String? {
        
        switch self.httpOperation {
        case .get:
            return "/s3k6-pzi2.json"
        case .post(_):
            return "POSTPath"   // used in future for post query
        }
        
        
    }
    
    
    
}

protocol HttpServicable {
    
    var endPoint: EndPoint? {get set}
    var header: [String: String]? {get set}
    
    func makeRequest() -> URLRequest?
    func fetch<T>(withType type: T.Type) async -> T? where T : Decodable
    
}


extension HttpServicable {
    
    func makeRequest() -> URLRequest? {
        
        guard let _url = self.endPoint?.url else {
            return nil
        }
        var request = URLRequest(url: _url)
        
        request.allHTTPHeaderFields = self.header
        return request
    }
    
    func fetch<T>(withType type: T.Type) async -> T? where T : Decodable {
       
        guard let _req = self.makeRequest() else {
            return nil
        }
        
        let response = try? await URLSession.shared.data(for: _req)
        let parsedObj = try? JSONDecoder().decode(T.self, from: response?.0 ?? Data())
        
        return parsedObj
        
    }
    
    
}

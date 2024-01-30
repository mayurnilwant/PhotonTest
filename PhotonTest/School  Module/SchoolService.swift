//
//  SchoolService.swift
//  PhotonTest
//
//  Created by Mayur Nilwant on 30/01/2024.
//

import Foundation



class SchoolService: HttpServicable {
    
    var endPoint: EndPoint?
    var header: [String : String]?
   
    
    init(endPoint: EndPoint? = nil, header: [String : String]? = nil) {
        self.endPoint = endPoint
        self.header = header
    }
    
    func getSchools() async -> [School]? {

        let result =  await self.fetch(withType: [School].self)
        return  result
    }
}

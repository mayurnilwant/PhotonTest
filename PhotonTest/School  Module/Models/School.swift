//
//  School.swift
//  PhotonTest
//
//  Created by Mayur Nilwant on 30/01/2024.
//

import Foundation


struct School: Decodable, Identifiable, Hashable {
    
    let id =  UUID()
    let dbn: String
    let schoolName: String
    let boro: String
    let overviewparagraph : String
    
    enum CodingKeys: String, CodingKey {
        
        case dbn = "dbn"
        case schoolName = "school_name"
        case boro = "boro"
        case overviewparagraph = "overview_paragraph"
        
    }
    
    init(from decoder: Decoder) throws {
            
        let container = try? decoder.container(keyedBy: CodingKeys.self)
            self.schoolName = try container?.decode(String.self, forKey: .schoolName) ?? ""
            self.boro = try container?.decode(String.self, forKey: .boro) ?? ""
            self.dbn = try container?.decode(String.self, forKey: .dbn) ?? ""
            self.overviewparagraph = try container?.decode(String.self, forKey: .overviewparagraph) ?? ""
    }
}

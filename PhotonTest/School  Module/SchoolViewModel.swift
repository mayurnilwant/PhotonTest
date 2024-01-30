//
//  SchoolViewModel.swift
//  PhotonTest
//
//  Created by Mayur Nilwant on 30/01/2024.
//

import Foundation
import Combine



enum ViewModelStatus {
    
    case loading
    case success
    case failure
    case notInit
}


protocol  ViewModelProtocol {
    
    
    var viewModelStatus: ViewModelStatus { get set }
    
}

class SchoolViewModel: ViewModelProtocol, ObservableObject {
   
    var viewModelStatus: ViewModelStatus = .notInit
    let serice : SchoolService
    
    
    init(serice: SchoolService) {
        self.serice = serice
    }
    
    @Published var schools: [School]?
    
    func getSchools() async {
        
        self.viewModelStatus = .loading
        
            self.schools = await self.serice.getSchools()
            
            self.viewModelStatus = ((self.schools?.count) != nil) ? .success : .failure
        

        print("")
    }
}

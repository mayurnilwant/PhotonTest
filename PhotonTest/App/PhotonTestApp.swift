//
//  PhotonTestApp.swift
//  PhotonTest
//
//  Created by Mayur Nilwant on 30/01/2024.
//

import SwiftUI

@main
struct PhotonTestApp: App {
    var body: some Scene {
        WindowGroup {
            
            SchoolListView(schoolVM: SchoolViewModel(serice: SchoolService(endPoint: SchoolResourceEndPoint(withQery: [:], andHttpOperation: .get))))
        }
    }
}

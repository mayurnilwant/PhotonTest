//
//  SchoolDetailView.swift
//  PhotonTest
//
//  Created by Mayur Nilwant on 30/01/2024.
//

import Foundation
import SwiftUI


struct SchoolDetailView : View {
    
    let school: School
    
    init(school: School) {
        self.school = school
    }
    
    var body: some View {
        
            Text(self.school.overviewparagraph)
                .font(.system(size:20.0, weight: .semibold))

    }
}

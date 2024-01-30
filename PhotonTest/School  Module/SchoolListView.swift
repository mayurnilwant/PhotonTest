//
//  ContentView.swift
//  PhotonTest
//
//  Created by Mayur Nilwant on 30/01/2024.
//

import SwiftUI
import Combine

struct SchoolListView: View {
    
    @ObservedObject var schoolVM:  SchoolViewModel
    
    init(schoolVM: SchoolViewModel) {
        self.schoolVM = schoolVM
    }
    var body: some View {
            
        NavigationView {
            List(self.schoolVM.schools ?? [School]()) { school in
                Section {
                    
                    NavigationLink {
                        SchoolDetailView(school: school)
                    } label: {
                        
                            SchooCell(school: school)
                    
                    }
                }
                
              
            }
            
            .navigationTitle("Schools")
            .navigationBarTitleDisplayMode(.large)
        }
            
            .padding()
            .onAppear{
                Task {
                    await self.schoolVM.getSchools()
                    
                }
                
        }
    }
}


struct SchooCell: View {
    let school: School
    var body: some View {
        
        Text(school.schoolName)
            .font(.system(size: 16.0, weight: .bold))
        Text(school.dbn)
            .font(.system(size: 14.0, weight: .semibold))
        Text(school.boro)
            .font(.caption)
    }
}

//#Preview {
//    SchoolListView()
//}

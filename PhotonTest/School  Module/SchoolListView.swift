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
                        
                        SchooCell(school: school) { school in
                            
                            // Use this school object to push view.
                            
                        }
                    
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
    
    @State var shoudShowTipView = false
    
    var callBack : (School) ->Void
    
    init(school: School, callBack: @escaping (School) -> Void) {
        self.school = school
        self.callBack = callBack
    }
    
    var body: some View {
        
        VStack(spacing: 10) {
            
                ZStack {
                    if self.shoudShowTipView {
                        
                        Rectangle()
                            .frame(width: 100, height: 30)
                            .background(.blue)
                            .padding([.top], -30)
                    }
                    HStack(spacing: 10){
                        Text(school.schoolName)
                            .font(.system(size: 16.0, weight: .bold))
                            .foregroundColor(.blue)
                            .onTapGesture {
                                self.callBack(self.school)
                                
                            }
                            .onLongPressGesture {
                                //Show View here after catchinglong press
                                print("Long press")
                                self.shoudShowTipView = true
                            }
                            
                        
                        Spacer()
                        Text(school.dbn)
                            .font(.system(size: 14.0, weight: .bold))
                    }
           
            }
            
//            Text(school.boro)
//                .font(.caption)
        }
        
    }
}

//#Preview {
//    SchoolListView()
//}

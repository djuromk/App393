//
//  TabBar.swift
//  App393
//
//  Created by DJUROM on 25/03/2024.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color(.white) : Color(.gray))
                            .frame(height: 22)
                        
                        Text(index.rawValue)
                                .foregroundColor(selectedTab == index ? Color(.white) : Color(.gray))
                            .font(.system(size: 12, weight: .regular))
                        
                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 28)
        .background(Color("bg3"))
    }
}

enum Tab: String, CaseIterable {
    
    case Home = "Home"
    
    case Converter = "Converter"
        
    case Settings = "Settings"
    
}

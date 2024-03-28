//
//  LoadingView.swift
//  App393
//
//  Created by DJUROM on 25/03/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Image("logo_big")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                 
                    VStack {
                        
                        Spacer()
                        
                        ProgressView()
                            .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    LoadingView()
}

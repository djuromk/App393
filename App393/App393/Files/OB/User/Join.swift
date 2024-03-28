//
//  Join.swift
//  App393
//
//  Created by DJUROM on 25/03/2024.
//

import SwiftUI

struct Join: View {
    
    let telegram: URL
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()

            VStack(spacing: 15) {
                
                VStack {
                    
                    Text("Join us")
                        .foregroundColor(Color("primary"))
                        .font(.system(size: 32, weight: .bold))
                    
                    Text("Join our telegram and make money ")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                }
                .padding()
                
                Image("U1")
                    .resizable()

            }
            
            VStack {
                
                Spacer()
                
                
                Button(action: {
                    
                    UIApplication.shared.open(telegram)
                    
                }, label: {
                    
                    Text("Join")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color("primary")))
                        .padding()
                })
            }
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Notif()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                            .padding(6)
                            .background(Circle().fill(.white.opacity(0.3)))
                            .padding()
                    })
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    Join(telegram: URL(string: "h")!)
}

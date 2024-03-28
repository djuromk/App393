//
//  U_1.swift
//  App393
//
//  Created by DJUROM on 25/03/2024.
//

import SwiftUI

struct U_1: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {

        ZStack {
            
            Color.black

            .ignoresSafeArea()

            VStack(spacing: 15) {
                
                HStack {
                    
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color("primary"))
                        .frame(width: 30, height: 6)

                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color("primary").opacity(0.5))
                        .frame(width: 30, height: 6)

                }
                
                Text("Grow and succes")
                    .foregroundColor(Color("primary"))
                    .font(.system(size: 32, weight: .bold))
                
                Text("Use smart tools and make more money")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                
                Image("U1")
                    .resizable()

            }
            
            VStack {
                
                Spacer()
                
                
                NavigationLink(destination: {
                    
                    Reviews(telegram: telegram, isTelegram: isTelegram)
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color("primary")))
                        .padding()
                })
            }
        }
    }
}

#Preview {
    U_1(telegram: URL(string: "h")!, isTelegram: false)
}

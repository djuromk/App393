//
//  Rev_2.swift
//  App393
//
//  Created by DJUROM on 25/03/2024.
//

import SwiftUI

struct Rev_2: View {
    var body: some View {

        ZStack {
            
            Color.black

            .ignoresSafeArea()

            VStack {
                
                Image("Rev2")
                    .resizable()
            }
            
            VStack(spacing: 15) {
                
                HStack {

                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color("primary").opacity(0.5))
                        .frame(width: 30, height: 6)
                    
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color("primary"))
                        .frame(width: 30, height: 6)
                    
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color("primary").opacity(0.5))
                        .frame(width: 30, height: 6)
                    
                }
                
                Text("Smart calculator")
                    .foregroundColor(Color("primary"))
                    .font(.system(size: 32, weight: .bold))
                
                Text("Add its title and short name to convert")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Rev_3()
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
    Rev_2()
}

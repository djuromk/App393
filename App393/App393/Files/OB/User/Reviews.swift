//
//  Reviews.swift
//  App393
//
//  Created by DJUROM on 25/03/2024.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {

        ZStack {
            
            Color.black

            .ignoresSafeArea()

            VStack(spacing: 15) {
                
                HStack {

                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color("primary").opacity(0.5))
                        .frame(width: 30, height: 6)
                    
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color("primary"))
                        .frame(width: 30, height: 6)
                    
                }
                
                Text("Make us better")
                    .foregroundColor(Color("primary"))
                    .font(.system(size: 32, weight: .bold))
                
                Text("Rate our app at AppStore")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                
                Image("Reviews")
                    .resizable()

            }
            
            VStack {
                
                Spacer()
                
                
                NavigationLink(destination: {
                    
                    if isTelegram == true {
                        
                        Join(telegram: telegram)
                            .navigationBarBackButtonHidden()
                        
                    } else if isTelegram == false {
                        
                        Notif()
                            .navigationBarBackButtonHidden()
                    }
                    
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
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Reviews(telegram: URL(string: "h")!, isTelegram: false)
}

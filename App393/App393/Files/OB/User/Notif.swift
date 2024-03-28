//
//  Notif.swift
//  App393
//
//  Created by DJUROM on 25/03/2024.
//

import SwiftUI
import OneSignalFramework

struct Notif: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.black

            .ignoresSafeArea()

            VStack(spacing: 15) {
                
                VStack {
                    
                    Text("Don't miss anything")
                        .foregroundColor(Color("primary"))
                        .font(.system(size: 32, weight: .bold))
                    
                    Text("Enable notifications")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                }
                .padding()
                
                Image("Notif")
                    .resizable()

            }
            
            VStack {
                
                Spacer()
                
                
                Button(action: {
                    
                    OneSignal.Notifications.requestPermission({ accepted in
                      print("User accepted notifications: \(accepted)")
                        status = true
                    }, fallbackToSettings: true)
                    
                }, label: {
                    
                    Text("Enable Notifications")
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
                    
                    Button(action: {
                        
                        status = true
                        
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
    Notif()
}

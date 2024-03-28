//
//  SettingsView.swift
//  App393
//
//  Created by DJUROM on 25/03/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @State var isReset: Bool = false
    
    @AppStorage("curCur") var curCur = ""
    @AppStorage("curCurInfo") var curCurInfo = ""
    @AppStorage("changeCur") var changeCur = ""
    @AppStorage("status") var status: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color("bg3")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(Color("primary"))
                    .font(.system(size: 20, weight: .medium))
                    .padding()
                
                VStack(spacing: 12) {
                    
                    Button(action: {
                        
                        guard let url = URL(string: DataManager().usagePolicy) else { return }
                        
                        UIApplication.shared.open(url)

                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "text.justify")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 18, weight: .regular))
                            
                            Text("Usage Profile")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 18, weight: .regular))
                            
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(Rectangle().fill(.white.opacity(0.15)))
                    })
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "star.circle")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 18, weight: .regular))
                            
                            Text("Rate app")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 18, weight: .regular))
                            
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(Rectangle().fill(.white.opacity(0.15)))
                    })
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            isReset = true
                        }
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "trash.circle")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 18, weight: .regular))
                            
                            Text("Reset confirmation")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 18, weight: .regular))
                            
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(Rectangle().fill(.white.opacity(0.15)))
                    })
                    
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Rectangle().fill(Color.black))
                .ignoresSafeArea()
            }
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(isReset ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            isReset = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                isReset = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Reset Confirmation")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Your progress will be permanently reset. Do you really want to delete all data?")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteAllData()
                        
                        curCur = ""
                        curCurInfo = ""
                        changeCur = ""
                        status = false
                        
                        withAnimation(.spring()) {
                            
                            isReset = false
                            
                        }
                        
                    }, label: {
                        
                        Text("Reset")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            isReset = false
                        }
                        
                    }, label: {
                        
                        Text("Cancel")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg").opacity(0.9)))
                .padding()
                .offset(y: isReset ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    SettingsView()
}

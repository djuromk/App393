//
//  SavedOper.swift
//  App393
//
//  Created by DJUROM on 25/03/2024.
//

import SwiftUI

struct SavedOper: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg3")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Saved")
                    .foregroundColor(Color("primary"))
                    .font(.system(size: 18, weight: .medium))
                    .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ForEach(viewModel.operations, id: \.self) { index in
                        
                            VStack(spacing: 15) {
                                
                                HStack {
                                    
                                    Text(index.conCurOne ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24, weight: .semibold))
                                    
                                    Spacer()
                                    
                                    Text(index.conValOne ?? "")
                                        .foregroundColor(Color("primary"))
                                        .font(.system(size: 24, weight: .semibold))

                                }
                                
                                HStack {
                                    
                                    Image(systemName: "arrow.up.arrow.down")
                                        .foregroundColor(Color("primary"))
                                        .font(.system(size: 18, weight: .semibold))
                                    
                                    Spacer()
                                }
                                
                                HStack {
                                    
                                    Text(index.conCurTwo ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24, weight: .semibold))
                                    
                                    Spacer()
                                    
                                    Text(index.conValTwo ?? "")
                                        .foregroundColor(Color("primary"))
                                        .font(.system(size: 24, weight: .semibold))                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Rectangle().fill(Color.white.opacity(0.15)))
                            .padding(.bottom, 5)
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchOper()
        }
    }
}

#Preview {
    SavedOper()
}

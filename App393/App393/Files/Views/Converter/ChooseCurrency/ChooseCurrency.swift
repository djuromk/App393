//
//  ChooseCurrency.swift
//  App393
//
//  Created by DJUROM on 25/03/2024.
//

import SwiftUI

struct ChooseCurrency: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        
        ZStack {
            
            Color(.black)
                .ignoresSafeArea()
            
            VStack {
                
                Text("Choose currency")
                    .foregroundColor(Color("primary"))
                    .font(.system(size: 18, weight: .regular))
                    .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ForEach(viewModel.currencies, id: \.self) { index in
                            
                            VStack(spacing: 10) {
                                
                                Button(action: {
                                    
                                    viewModel.changeCur = index.curAbr ?? ""
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isChart = true
                                    }
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 12) {
                                            
                                            Text(index.curAbr ?? "")
                                                .foregroundColor(Color("primary"))
                                                .font(.system(size: 32, weight: .bold))
                                            
                                            Text(index.curTitle ?? "")
                                                .foregroundColor(Color("primary").opacity(0.3))
                                                .font(.system(size: 18, weight: .medium))
                                        }
                                        
                                        Spacer()
                                        
                                        Text(index.curValue ?? "")
                                            .foregroundColor(Color("primary"))
                                            .font(.system(size: 32, weight: .bold))
                                    }
                                    .padding()
                                    .background(Rectangle().fill(Color("bg3").opacity(0.8)))
                                })
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchCurrencies()
        }
        .sheet(isPresented: $viewModel.isChart, content: {
            
            ChartView(viewModel: viewModel)
        })
    }
}

#Preview {
    ChooseCurrency(viewModel: HomeViewModel())
}

//
//  ChartView.swift
//  App393
//
//  Created by DJUROM on 25/03/2024.
//

import SwiftUI

struct ChartView: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text(viewModel.changeCur)
                    .foregroundColor(Color("primary"))
                    .font(.system(size: 18, weight: .regular))
                    .padding()
                
                Image("graph")
                    .resizable()
                
                HStack {
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isChart = false
                        }
                        
                    }, label: {
                        
                        Text("Back")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Rectangle().fill(.red))
                    })
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isChart = false
                            viewModel.isChoose = false
                        }
      
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Rectangle().fill(.green))
                    })
                }
                .padding()
                .padding(.top, 90)
            }
        }
    }
}

#Preview {
    ChartView(viewModel: HomeViewModel())
}

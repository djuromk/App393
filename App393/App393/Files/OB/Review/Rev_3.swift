//
//  Rev_3.swift
//  App393
//
//  Created by DJUROM on 25/03/2024.
//

import SwiftUI

struct Rev_3: View {
    
    @StateObject var viewModel = HomeViewModel()
    @AppStorage("status") var status: Bool = false
    
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
                        .fill(Color("primary").opacity(0.5))
                        .frame(width: 30, height: 6)
                    
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color("primary"))
                        .frame(width: 30, height: 6)
                    
                }
                
                Text("Add your currency")
                    .foregroundColor(Color("primary"))
                    .font(.system(size: 32, weight: .bold))
                
                Text("Add its title and short name to convert ")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                
                ZStack(alignment: .leading, content: {
                    
                    Text("Title")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .opacity(viewModel.curInfT.isEmpty ? 1 : 0)
                    
                    TextField("", text: $viewModel.curInfT)
                        .foregroundColor(Color("primary"))
                        .font(.system(size: 14, weight: .regular))
                    
                })
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 70)
                .background(Rectangle().fill(Color.white.opacity(0.2)))
                .padding(.horizontal)
                .padding(.top, 100)
                
                ZStack(alignment: .leading, content: {
                    
                    Text("Abbreviation")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .opacity(viewModel.curInfA.isEmpty ? 1 : 0)
                    
                    TextField("", text: $viewModel.curInfA)
                        .foregroundColor(Color("primary"))
                        .font(.system(size: 14, weight: .regular))
                    
                })
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 70)
                .background(Rectangle().fill(Color.white.opacity(0.2)))
                .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.curCur = viewModel.curInfA
                    viewModel.curCurInfo = viewModel.curInfT
                    
                    viewModel.curInfA = ""
                    viewModel.curInfT = ""
                    
                    status = true
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color("primary")))
                        .padding()
                })
                .opacity(viewModel.curInfA.isEmpty || viewModel.curInfT.isEmpty ? 0.5 : 1)
                .disabled(viewModel.curInfA.isEmpty || viewModel.curInfT.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    Rev_3()
}

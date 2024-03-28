//
//  ConverterView.swift
//  App393
//
//  Created by DJUROM on 25/03/2024.
//

import SwiftUI

struct ConverterView: View {

    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg3")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Converter")
                        .foregroundColor(Color("primary"))
                        .font(.system(size: 20, weight: .medium))
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isSaved = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "clock")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 20, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    })
                }
                .padding()
                
                HStack(content: {
                    
                    if viewModel.curCur.isEmpty {
                        
                        Text(viewModel.EC)
                            .foregroundColor(.white)
                            .font(.system(size: 28, weight: .semibold))
                        
                    } else {
                        
                        Text(viewModel.curCur)
                            .foregroundColor(.white)
                            .font(.system(size: 28, weight: .semibold))
                    }
                    
                    Spacer()
                    
                    TextField("", text: $viewModel.conValOne)
                        .foregroundColor(Color.white)
                        .font(.system(size: 20, weight: .medium))
                        .frame(width: 90)
                    
                })
                .padding()
                .frame(height: 70)
                .background(Rectangle().fill(Color.black))
                .padding()
                
                Image(systemName: "arrow.up.arrow.down")
                    .foregroundColor(Color("bg2").opacity(0.2))
                    .font(.system(size: 30, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                
                VStack(spacing: 12) {

                    HStack(content: {
                        
                        if viewModel.changeCur.isEmpty {
                            
                           Button(action: {
                               
                               withAnimation(.spring()) {
                                   
                                   viewModel.isChoose = true
                               }
                               
                           }, label: {
                               
                               HStack {
                                   
                                   Text("Choose currency")
                                       .foregroundColor(.white)
                                       .font(.system(size: 18, weight: .regular))
                                   
                                   Image(systemName: "chevron.right")
                                       .foregroundColor(.white)
                                       .font(.system(size: 18, weight: .regular))
                                   
                                   Spacer()
                                   
                               }
                           })
                            
                        } else {
                            
                            Text(viewModel.changeCur)
                                .foregroundColor(.white)
                                .font(.system(size: 28, weight: .semibold))
                        }
                        
                        Spacer()
                        
                        if viewModel.conValOne.isEmpty || viewModel.isCalculate == false {
                            
                            Text("0")
                                .foregroundColor(Color.white.opacity(0.4))
                                .font(.system(size: 20, weight: .regular))
                                .frame(width: 15)
                            
                        } else if viewModel.isCalculate && !viewModel.conValOne.isEmpty {
                                                            
                            Text(viewModel.random)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 20, weight: .regular))
                        }
                    })
                    .padding()
                    .frame(height: 70)
                    .background(Rectangle().fill(Color.white.opacity(0.15)))
                    
                    if viewModel.isCalculate == false {
                        
                        Button(action: {
                            
                            viewModel.isCalculate = true
                            
                        }, label: {
                            
                            Text("Calculate")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 70)
                                .background(Rectangle().fill(Color("primary")))
                            
                        })
                        .padding(.top, 100)
                        
                        .opacity(viewModel.conValOne.isEmpty || viewModel.changeCur.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.conValOne.isEmpty || viewModel.changeCur.isEmpty ? true : false)
                        
                    } else {
                        
                        Button(action: {
                            
                            if viewModel.curCur.isEmpty {
                                
                                viewModel.conCurOne = viewModel.EC
                                
                            } else {
                                
                                viewModel.conCurOne = viewModel.curCur

                            }
                            
                            viewModel.conCurTwo = viewModel.changeCur
                            viewModel.conValTwo = viewModel.random

                            viewModel.addOper()
                            
                            viewModel.changeCur = ""
                            viewModel.conCurOne = ""
                            viewModel.conCurOne = ""
                            viewModel.conCurTwo = ""
                            viewModel.conValOne = ""
                            viewModel.conValTwo = ""
                            
                            viewModel.fetchOper()
                            
                            viewModel.isCalculate = false

                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 70)
                                .background(Rectangle().fill(Color("primary")))
                            
                        })
                        .padding(.top, 100)
                        
                        Button(action: {
                            
                            viewModel.conValOne = ""
                            viewModel.changeCur = ""
                            
                            viewModel.isCalculate = false

                        }, label: {
                            
                            Text("Reset")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 14, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 70)
                 
                        })
                    }
                    
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .ignoresSafeArea()
            }
        }
        .sheet(isPresented: $viewModel.isChoose, content: {
            
            ChooseCurrency(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isSaved, content: {
            
            SavedOper()
        })
    }
}

#Preview {
    ConverterView()
}

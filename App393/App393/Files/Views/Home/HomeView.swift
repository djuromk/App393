//
//  HomeView.swift
//  App393
//
//  Created by DJUROM on 25/03/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg3")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Home")
                        .foregroundColor(Color("primary"))
                        .font(.system(size: 20, weight: .medium))
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isNewCur = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "pencil")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 20, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    })
                }
                .padding()
                
                VStack(spacing: 12) {
                    
                    VStack(spacing: 12) {
                        
                        Text(viewModel.curCur)
                            .foregroundColor(.black)
                            .font(.system(size: 32, weight: .bold))
                        
                        Text(viewModel.curCurInfo)
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .background(Rectangle().fill(Color("bg2")))
                    
                    ZStack {
                    
                    if viewModel.currencies.isEmpty {
                        
                        VStack(spacing: 12) {
                            
                            Text("No currencies added")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 28, weight: .semibold))
                        }
                        .frame(maxHeight: .infinity)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack {
                                
                                Text("Currencies")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 28, weight: .medium))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                ForEach(viewModel.currencies, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedCurrency = index
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isDelete = true
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
                                                .font(.system(size: 30, weight: .bold))
                                        }
                                        .padding()
                                        .background(Rectangle().fill(Color("bg3").opacity(0.8)))
                                    })
                                }
                            }
                        }
                    }
                        
                        VStack {
                            
                            Spacer()
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAdd = true
                                }
                                
                            }, label: {
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .medium))
                                    .padding(14)
                                    .background(Circle().fill(Color("primary")))
                                    .padding()
                            })
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .ignoresSafeArea()
            }
        }
        .onAppear {
            
            viewModel.fetchCurrencies()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAdd ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd  = false
                        }
                    }
                
                VStack {

                        Text("Add new currency")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 16, weight: .medium))
                            .padding()

                    ZStack(alignment: .leading, content: {
                        
                        Text("Title")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.curTitle.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.curTitle)
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 70)
                    .background(Rectangle().fill(Color.white.opacity(0.2)))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Abbreviation")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.curAbr.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.curAbr)
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 70)
                    .background(Rectangle().fill(Color.white.opacity(0.2)))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Value")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.curValue.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.curValue)
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 70)
                    .background(Rectangle().fill(Color.white.opacity(0.2)))
                    
                    Spacer()

                    Button(action: {
                                                
                        viewModel.addCurrency()
                        
                        viewModel.curTitle = ""
                        viewModel.curValue = ""
                        viewModel.curAbr = ""
                        
                        viewModel.fetchCurrencies()

                        withAnimation(.spring()) {
                            
                            viewModel.isAdd  = false
                        }
                        
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Rectangle().fill(Color("primary")))
                        
                    })
                    .disabled(viewModel.curTitle.isEmpty || viewModel.curAbr.isEmpty || viewModel.curValue.isEmpty ? true : false)
                    .opacity(viewModel.curTitle.isEmpty || viewModel.curAbr.isEmpty || viewModel.curValue.isEmpty ? 0.5 : 1)
                    .padding(.top, 120)
                    .padding(.bottom, 30)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .bottom)
                .frame(height: 600)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.black).ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isAdd  ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isNewCur ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isNewCur  = false
                        }
                    }
                
                VStack {

                        Text("Edit main currency")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 16, weight: .medium))
                            .padding()

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
                    .padding(.top, 120)
                    .padding(.bottom, 30)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .bottom)
                .frame(height: 600)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.black).ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isNewCur  ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteCur(withCurTitle: viewModel.selectedCurrency?.curTitle ?? "", completion: {
                            
                            viewModel.fetchCurrencies()
                        })
          
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            
                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Cancel")
                            .foregroundColor(.blue)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.black))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    HomeView()
}

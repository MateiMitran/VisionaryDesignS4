//
//  ContentView.swift
//  VisionaryDesign
//
//  Created by Bianca Onea on 30/05/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack{
                    Image("login")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                        .opacity(0.8)
                    VStack(spacing:270){
                    Image("logoapp")
                        .padding()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        
                        NavigationLink(destination: MainScreen(), label: {Text("Get Started")
                                .bold()
                                .frame(width: 280, height: 50)
                                .background(Color.purple)
                                .foregroundColor(.white)
                                .cornerRadius(30)
                        })
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                        .navigationTitle("")
                        .frame(width: 280, height: 50, alignment: .bottom)

                        
                    
                }
                }
                    
                }
        }

            }
        }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



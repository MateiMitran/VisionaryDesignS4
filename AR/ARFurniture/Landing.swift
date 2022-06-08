//
//  Landing.swift
//  ARFurniture
//
//  Created by Bianca Onea on 08/06/2022.
//

import Foundation
import SwiftUI

struct Landing: View {
    
    var body : some View {
        NavigationView {
            GeometryReader { geo in
                ZStack{
                    Image("login")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                        .opacity(0.8)
                    
                    VStack(spacing:150) {
                        Image("logoapp")
                            .padding()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(.bottom)
                            .position(x: 200, y: 280)
                        
                        NavigationLink(destination: ContentView(), label: {Text("Get Started")
                                .bold()
                                .frame(width: 280, height: 50)
                                .background(Color.purple)
                                .foregroundColor(.white)
                                .cornerRadius(30)
                        })
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                        .navigationTitle("")
                        .position(x: 200, y: 250)
//                        .frame(maxHeight: .infinity, alignment: .bottom)
//                        .frame(width: 280, height: 50, alignment: .bottom)
                        
                    }
//                    .frame(maxHeight: .infinity, alignment: .bottom)
                }
            }
        }
    }
}



struct Landing_Previews: PreviewProvider {
    static var previews: some View {
        Landing()
    }
}


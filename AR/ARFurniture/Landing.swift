//
//  Landing.swift
//  ARFurniture
//
//  Created by Bianca Onea on 08/06/2022.
//

import Foundation
import SwiftUI

struct Landing: View {

    var body: some View {
        NavigationView{
        VStack {
            Image("img1")
                .resizable()
                .frame(width: 200, height: 550)
                .position(x: 85, y: 110)
            
            Image("img2")
                .resizable()
                .frame(width: 230, height: 220)
                .position(x: 320, y: -110)
            
            Image("img3")
                .resizable()
                .frame(width: 230, height: 220)
                .position(x: 320, y: -10)
            
            
            Text("Visionary")
               // .font(.custom("Arsenal-Regular", size: 60))
                .position(x: 200, y: 55)
                .foregroundColor(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.72, saturation: 0.466, brightness: 0.648)/*@END_MENU_TOKEN@*/)
            
            Text("Design")
               // .font(.custom("PlayfairDisplay-Regular", size: 45))
                .position(x: 200, y: -30)
                .foregroundColor(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.72, saturation: 0.466, brightness: 0.648)/*@END_MENU_TOKEN@*/)
            
            NavigationLink(destination: ContentView(), label: {Text("Get Started")
                    .bold()
                    .frame(width: 280, height: 50)
                    .foregroundColor(.white)
                    .cornerRadius(30)
                    
            })
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .navigationTitle("")
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.72, saturation: 0.466, brightness: 0.648)/*@END_MENU_TOKEN@*/)
            .cornerRadius(30)
        }


    
    }
    }
}

struct Landing_Previews: PreviewProvider {
    static var previews: some View {
        Landing()
    }
}


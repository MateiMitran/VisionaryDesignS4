//
//  MainScreen.swift
//  VisionaryDesignApp
//
//  Created by Bianca Onea on 01/06/2022.
//

import SwiftUI

struct MainScreen: View {
    
    var body : some View {
        HStack
        {
            Button(action: {
                print("Delete button tapped!")
            }) {
                Text("Furniture")
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .font(.caption)
                    .frame(width: 150, height: 50)
            }
            
            Button(action: {
                print("Delete button tapped!")
            }) {
                Text("Seats & Chairs")
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .font(.caption)
                    .frame(width: 150, height: 50)
            }
            
            Button(action: {
                print("Delete button tapped!")
            }) {
                Text("Tables")
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .font(.caption)
                    .frame(width: 150, height: 50)
            }
            
            Button(action: {
                print("Delete button tapped!")
            }) {
                Text("Beds")
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .font(.caption)
                    .frame(width: 120, height: 50)
            }

        }
        .rotationEffect(.degrees(90))
        .position(x: 270, y: 260)
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}


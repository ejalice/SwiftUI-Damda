//
//  CardFrontView.swift
//  Damda
//
//  Created by 이창형 on 2022/11/23.
//

import SwiftUI

struct CardFrontView : View {
    let imageName: String
    let drinkName: String
    let width : CGFloat
    let height : CGFloat
    @Binding var degree : Double
    @Binding var isFlipped: Bool
    
    var body: some View {
        
        VStack{
            Spacer()
                Rectangle()
                    .cornerRadius(16)
                    .foregroundColor(Color.damdaGray500)
                    .padding()
                    .frame(height: height)
                    .overlay(
                        VStack(spacing: 0){
                            Spacer()
                            Image(imageName)
                                .resizable()
                                .frame(maxWidth: 138, maxHeight: 355)
                                .scaledToFit()
                            Text("\(drinkName)주")
                                .LargeTitle()
                                .bold()
                                .foregroundColor(Color.damdaGray100)
                                .padding(.top, 40)
                                .padding(.bottom, 20)
                            
                            Text("2022.11.09 ~")
                                .Title2()
                                .foregroundColor(Color.damdaGray300)
                                .padding(.bottom, 92)

                        }
                    )
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}


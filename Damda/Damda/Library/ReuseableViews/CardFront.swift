//
//  CardFront.swift
//  Damda
//
//  Created by 이창형 on 2022/11/23.
//

import SwiftUI

struct CardFront : View {
    let imageName: String
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
                    .frame(maxHeight: UIScreen.main.bounds.height/1.2)
                    .overlay(
                        VStack(spacing: 0){
                            Spacer()
                            Image("Bottle_01")
                                .resizable()
                                .frame(maxWidth: 138, maxHeight: 355)
                                .scaledToFit()
                            Text("앞")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.white)
                                .padding(.top, 40)
                                .padding(.bottom, 20)
                            
                            Text("2022.11.09 ~")
                                .font(.title2)
                                .foregroundColor(Color.damdaGray100)

                            Button{
                                
                            } label: {
                                Text("더 알아보기")
                                    .foregroundColor(.white)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 16)
                                    .background(Color.damdaGray600)
                                    .cornerRadius(16)
                                    
                            }
                            .padding(.top, 25)
                            .padding(.bottom, 50)
                        }
                    )
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}


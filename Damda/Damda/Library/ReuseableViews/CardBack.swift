//
//  CardBack.swift
//  Damda
//
//  Created by 이창형 on 2022/11/23.
//

import SwiftUI

struct CardBack : View {
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
                    .frame(height: height)
                    .overlay(
                        VStack(spacing: 0){
                            HStack {
                                Text("숙성기간")
                                    .foregroundColor(Color.damdaGray300)
                                    .Subhead()
                
                                // TODO: 데이터 받아와야 함
                                Text("3일")
                                    .foregroundColor(Color.damdaGray100)
                                    .Body1()
                                Spacer()
                            }
                            .padding(.top, 72)
                            .padding(.leading, 51)
                            
                            HStack {
                                Text("어떤 일이 있었나요?")
                                    .foregroundColor(Color.damdaGray300)
                                    .Subhead()
                                Spacer()
                            }
                            .padding(.top, 38)
                            .padding(.leading, 51)
                            
                            // TODO: 데이터 받아와야 함
                            Text("야채 먹기 싫어서 안먹었는데 그거 가지고 하루 종일 꼽주네요 야채 안먹어도 살아 갈 수 있는데 어이 없네요 정말로 야채 안먹어도 잘 살았는데 왜그러는 걸까요")
                                .foregroundColor(Color.damdaGray100)
                                .Body1()
                                .padding(.top, 8)
                                .padding(.leading, 51)
                                .padding(.trailing, 29)
                            
                            HStack {
                                Text("히스토리")
                                    .foregroundColor(Color.damdaGray300)
                                    .Subhead()
                                Spacer()
                            }
                            .padding(.top, 38)
                            .padding(.leading, 51)
                            
                            Spacer()
                            
                        }
                    )
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

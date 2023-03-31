//
//  DetailViewFront.swift
//  Damda
//
//  Created by 이창형 on 2022/11/23.
//

import SwiftUI

struct DetailView: View {
    @State var backDegree = 90.0
    @State var frontDegree = 0.0
    @State var isFlipped = false
    
    var drink: Drink
    
    let durationAndDelay : CGFloat = 0.3
    
    func flipCard () {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
        }
    }
    
    var body: some View {
        ZStack{
            Color.damdaBackGround.ignoresSafeArea()
            ZStack{
                CardBackView(imageName: drink.imageName ?? "", width: 358, height: 660, degree: $backDegree, isFlipped: $isFlipped)
                ZStack{
                    CardFrontView(imageName: drink.imageName ?? "", drinkName: drink.drinkName ?? "", width: 358, height: 660, degree: $frontDegree, isFlipped: $isFlipped)
                    VStack(spacing: 0) {
                        Spacer()
                        Button{
                            flipCard()
                        } label: {
                            if isFlipped {
                                Text("술 이름 확인")
                                    .foregroundColor(Color.damdaGray100)
                                    .Body2()
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 16)
                                    .background(Color.damdaGray600)
                                    .cornerRadius(16)
                            }
                            else {
                                Text("더 알아보기")
                                    .foregroundColor(Color.damdaGray100)
                                    .Body2()
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 16)
                                    .background(Color.damdaGray600)
                                    .cornerRadius(16)
                            }
                        }
                        .padding(.bottom, 40)
                    }
                }
            }
        }
    }
}


//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}

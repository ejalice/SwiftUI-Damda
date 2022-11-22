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
                CardBack(imageName: "Bottle_01", width: 358, height: 660, degree: $backDegree, isFlipped: $isFlipped)
                CardFront(imageName: "Bottle_01", width: 358, height: 660, degree: $frontDegree, isFlipped: $isFlipped)
            }
            .onTapGesture {
                flipCard()
            }
        }
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

//
//  DetailViewFront.swift
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
                            Text("롬주")
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
                    .frame(maxHeight: UIScreen.main.bounds.height/1.2)
                    .overlay(
                        VStack(spacing: 0){
                            Spacer()
                            Image("Bottle_01")
                                .resizable()
                                .frame(maxWidth: 138, maxHeight: 355)
                                .scaledToFit()
                            Text("롬주")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.white)
                                .padding(.top, 40)
                                .padding(.bottom, 20)
                            
                            Text("2022.11.09 ~")
                                .font(.title2)
                                .foregroundColor(Color.damdaGray100)

                            Button{
                                print("하이")
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

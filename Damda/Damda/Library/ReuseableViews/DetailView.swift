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
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: width, height: height)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
            
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
            Rectangle()
                .foregroundColor(.damdaBackGround)
                .ignoresSafeArea()
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
            }
        }
    }
}

extension DetailView {
    
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

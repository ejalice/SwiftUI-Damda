//
//  MessageView.swift
//  Damda
//
//  Created by eunji on 2022/11/23.
//

import SwiftUI

struct MessageView: View {
    @State var show: [Bool] = [false, false]
    
    var damdaMessage: [String] = [
        "잊지 않고 ‘App Name’을 방문해주셔서 감사합니다",
        "언제 있었던 일을 기록하고 싶으신가요?",
        "그 사람을 부르는 나만의 별명을 알려주세요",
        "어떠한 일이 있었는지 알려주세요",
        "오늘 들은 이야기를 바탕으로 00님께 어울리는 술을 추천해드릴게요! 조금만 기다려 주세요"
    ]
    
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    Spacer(minLength: 20)
                    
                    ForEach(0..<2){ num in
                        Group {
                            if show[num] {
                                DamdaText(damdaMessage[num])
                            } else {
                                DamdaText(damdaMessage[num]).hidden()
                            }
                        }
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 * Double((num+1))) {
                                self.show[num].toggle()
                            }
                        }
                        
                    }
                    
                    Spacer()
                    
                }.border(.blue)
                    .frame(width: UIScreen.main.bounds.width, height: 383)
                Spacer()
            }
            .background(Color.damdaBackGround)
        }
    }
    
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}

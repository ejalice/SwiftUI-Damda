//
//  MessageView.swift
//  Damda
//
//  Created by eunji on 2022/11/23.
//

import SwiftUI

struct MessageView: View {
    @State var showFirstMessage: [Bool] = [false, false, false]
    @State var dateSelected: Bool = false
    @State var selected: String?
    @State var strengthenScroll: Bool = false
    
    var damdaMessage: [String] = [
        "잊지 않고 ‘담다’을 방문해주셔서 감사합니다",
        "언제 있었던 일을 기록하고 싶으신가요?",
        "그 사람을 부르는 나만의 별명을 알려주세요",
        "어떠한 일이 있었는지 알려주세요",
        "오늘 들은 이야기를 바탕으로 술을 추천해드릴게요! 조금만 기다려 주세요"
    ]
    
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    Spacer(minLength: 20)
                    
                    ForEach(0..<3){ num in
                        Group {
                            
                            if showFirstMessage[num] {
                                if (num != 2) {
                                    DamdaText(damdaMessage[num])
                                } else {
                                    DateView(selected: $selected, strengthenScroll: $strengthenScroll)
                                }
                            } else {
                                DamdaText(damdaMessage[num]).hidden()
                            }
                        }
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 * Double((num+1))) {
                                self.showFirstMessage[num].toggle()
                            }
                        }
                        
                    }
                    
                    Spacer()
                    
                }
                .border(.blue)
                .frame(width: UIScreen.main.bounds.width, height: strengthenScroll ? 670 : 383)
                .padding(.top, 1)
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

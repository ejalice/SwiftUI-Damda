//
//  MessageView.swift
//  Damda
//
//  Created by eunji on 2022/11/23.
//

import SwiftUI

struct MessageView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State var showFirstMessage: [Bool] = [false, false, false, false, false]
    @State var dateSelected: Bool = false
    @State var selected: String?
    @State var strengthenScroll: Bool = false
    @State var date = Date()
    
    @State var text: String = ""
    @State var isAnimating  = false
    @State var nicknameInput: String = ""
    @State var nicknameEntered = false
    @State var nickname: String = ""
    @State var containerHeight: CGFloat = 0
    @State var contentInput: String = ""
    @State var content: String = ""
    @State var contentEntered = false
    
    var damdaMessage: [String] = [
        "잊지 않고 ‘담다’을 방문해주셔서 감사합니다",
        "언제 있었던 일을 기록하고 싶으신가요?",
        "fdsa",
        "그 사람을 부르는 나만의 별명을 알려주세요",
        "어떠한 일이 있었는지 알려주세요",
        "오늘 들은 이야기를 바탕으로 술을 추천해드릴게요!\n조금만 기다려 주세요"
    ]
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 M월 d일"
        return formatter
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ScrollViewReader { value in
                        
                        Spacer(minLength: 20)
                        VStack(alignment: .leading) {
                            ForEach(0..<3){ num in
                                Group { //~
                                    if showFirstMessage[num] {
                                        if (num != 2) {
                                            DamdaText(damdaMessage[num])
                                        } else { // 날짜 선택하는 버튼들 띄움.
                                            if !dateSelected { // 날짜 선택 아직 안함.
                                                DateView(strengthenScroll: $strengthenScroll, date: $date, dateSelected: $dateSelected)
                                            }
                                            
                                            if dateSelected{ // 날짜 선택 완료.
                                                UserText(dateFormatter.string(from: date))
                                                DamdaText(damdaMessage[3])
                                            }
                                            
                                        }
                                    } else {
                                        DamdaText(damdaMessage[num]).hidden()
                                    }
                                } //~
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 * Double((num+1))) {
                                        self.showFirstMessage[num].toggle()
                                        print(num)
                                    }
                                }
                            }
                            
                            if nicknameEntered {
                                UserText(nickname).padding(.leading, 16)
                                DamdaText(damdaMessage[4])
                            }
                            
                            if contentEntered {
                                UserText(content).padding(.leading, 16)
                                DamdaText(damdaMessage[5])
                            }
                            
                            
//                            Spacer()
                            
                        }
                    }//~ ScrollView Reader
                }// ~ScrollView
                .border(.blue)
                .frame(width: UIScreen.main.bounds.width, height: strengthenScroll ? 670 : 383)
                .padding(.top, 1)
                
                    Spacer()
                    
                    if dateSelected {
                        HStack {
                            if !self.nicknameEntered {
                                AutoSizingTF(hint: "Enter Text PLZ", text: $nicknameInput, containerHeight: $containerHeight)
                                    .padding(.horizontal)
                                    .background(Color.damdaGray500)
                                    .frame(height: containerHeight <= 60 ? containerHeight : 60)
                                
                                Button {
                                    nicknameEntered = true
                                    nickname = nicknameInput
                                } label: {
                                    Image(systemName: "paperplane.fill")
                                        .foregroundColor(.damdaGray100)
                                }
                                .padding(.trailing, 16)
                            }
                        }
                        .background(Color.damdaGray500)
                    }
                    
                    if nicknameEntered {
                        HStack {
                            if !self.contentEntered {
                                AutoSizingTF(hint: "Enter text plz", text: $contentInput, containerHeight: $containerHeight)
                                    .padding(.horizontal)
//                                    .padding(.top, 20)
                                    .background(Color.damdaGray500)
//                                    .frame(height: containerHeight <= 60 ? 60 : containerHeight)
                                    .frame(height: getTextViewHeight(containerHeight: containerHeight))
                                // maxHeight 설정 못함....
                                
                                Button {
                                    contentEntered = true
                                    content = contentInput
                                } label: {
                                    Image(systemName: "paperplane.fill")
                                        .foregroundColor(.damdaGray100)
                                }
                                .padding(.trailing, 16)
                            }
                        }
                        .background(Color.damdaGray500)
                    }
                    
//                    Spacer()
                    
            }
        }
    }
    
    func getTextViewHeight(containerHeight: Double) -> Double {
        var textViewHeight: Double = 60
        if containerHeight < 60 {
            textViewHeight = 60
        } else {
            if containerHeight > 100 {
                textViewHeight = 100
            } else {
                textViewHeight = containerHeight
            }
        }
        return textViewHeight
    }
}



struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}

// https://www.youtube.com/watch?v=Jf8SzGLaRdA
struct AutoSizingTF: UIViewRepresentable {
    
    var becameFirstResponder = false
    
    var hint: String
    @Binding var text: String
    @Binding var containerHeight: CGFloat
    //    var onEnd: ()->()
    
    func makeCoordinator() -> Coordinator {
        return AutoSizingTF.Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        
        let textView = UITextView()
        // Displaying text as hint
        textView.text = hint
        textView.textColor = .white
        textView.backgroundColor = UIColor(Color.damdaGray500)
        textView.font = .Body2
        textView.textContainerInset = .init(top: 20, left: 20, bottom: 20, right: 8)
        
        // setting delegate
        textView.delegate = context.coordinator
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        if !context.coordinator.becameFirstResponder {
            uiView.becomeFirstResponder()
            context.coordinator.becameFirstResponder = true
        }
        // Starting Text Field Height ..
        DispatchQueue.main.async {
            if containerHeight == 0 {
                containerHeight = uiView.contentSize.height
            }
        }
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        
        var becameFirstResponder = false
        
        // To read all parent properties ...
        var parent: AutoSizingTF
        
        init(parent: AutoSizingTF) {
            self.parent = parent
        }
        // Keyboard close @objc function ..
        //        @objc func closeKeyBoard() {
        //            parent.onEnd()
        //        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            // checking if text box is empty ..
            // is so then clearing the hint ..
            
            if textView.text == parent.hint {
                textView.text = ""
                textView.textColor = UIColor(.damdaGray100)
            }
        }
        
        // updating text in SwiftUI View
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
            parent.containerHeight = textView.contentSize.height
        }
        
        // On End checking if textbox is empty
        // if so then put hint..
        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text == "" {
                textView.text = parent.hint
                textView.textColor = UIColor(.damdaGray100)
            }
        }
    }
}

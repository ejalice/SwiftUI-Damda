//
//  MessageView.swift
//  Damda
//
//  Created by eunji on 2022/11/23.
//

import SwiftUI

struct MessageView: View {
    @State var showFirstMessage: [Bool] = [false, false, false, false, false]
    @State var dateSelected: Bool = false
    @State var selected: String?
    @State var strengthenScroll: Bool = false
    @State var date = Date()
    
    @State var text: String = ""
    @State var isAnimating  = false
    @State var keyboardInput: String = ""
    @State var inputEntered = false
    @State var containerHeight: CGFloat = 0
    
    
    var damdaMessage: [String] = [
        "잊지 않고 ‘담다’을 방문해주셔서 감사합니다",
        "언제 있었던 일을 기록하고 싶으신가요?",
        "fdsa",
        "그 사람을 부르는 나만의 별명을 알려주세요",
        "어떠한 일이 있었는지 알려주세요",
        "오늘 들은 이야기를 바탕으로 술을 추천해드릴게요! 조금만 기다려 주세요"
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
                    Spacer(minLength: 20)
                    
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
                    
                    Spacer()
                    
                }
                .border(.blue)
                .frame(width: UIScreen.main.bounds.width, height: strengthenScroll ? 670 : 383)
                .padding(.top, 1)
                
                Spacer()
                
                if dateSelected {
                    HStack {
//                        TextField(
//                            "텍스트를 입력하세요",
//                            text: $nickname
//                        )
//                        FirstResponderTextField(text: $keyboardInput)
                        AutoSizingTF(hint: "Enter Text PLZ", text: $keyboardInput, containerHeight: $containerHeight, onEnd: {
                            // Do when keyboard closed ..
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        })
                            .padding(.horizontal)
                            .background(Color.white)
                            .frame(height: containerHeight <= 120 ?containerHeight : 120 )
                        
                        Button {
                            inputEntered = true
                            print(inputEntered)
                        } label: {
                            Image(systemName: "paperplane.fill")
                        }
                    }
                }
                Spacer()
            .background(Color.damdaBackGround)
            
            
            }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}

//struct FirstResponderTextField: UIViewRepresentable {
//
//    @Binding var text: String
//
//    class Coordinator: NSObject, UITextFieldDelegate {
//
//        @Binding var text: String
//        var becameFirstResponder = false
//
//        init(text: Binding<String>) {
//            self._text = text
//        }
//
//        func textFieldDidChangeSelection(_ textField: UITextField) {
//            text = textField.text ?? ""
//        }
//    }
//
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(text: $text)
//    }
//
//    func makeUIView(context: Context) -> some UIView {
//        let textField = UITextField()
//        textField.delegate = context.coordinator
//        return textField
//    }
//
//    func updateUIView(_ uiView: UIViewType, context: Context) {
//        if !context.coordinator.becameFirstResponder {
//            uiView.becomeFirstResponder()
//            context.coordinator.becameFirstResponder = true
//        }
//    }
//}


// https://www.youtube.com/watch?v=Jf8SzGLaRdA
struct AutoSizingTF: UIViewRepresentable {
    
    var becameFirstResponder = false

    var hint: String
    @Binding var text: String
    @Binding var containerHeight: CGFloat
    var onEnd: ()->()
    
    func makeCoordinator() -> Coordinator {
        return AutoSizingTF.Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> UITextView {
        
        let textView = UITextView()
        // Displaying text as hint
        textView.text = hint
        textView.textColor = .gray
        
        textView.font = .systemFont(ofSize: 20)
        
        // setting delegate
        textView.delegate = context.coordinator
        
        // Input Accessory View ..
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        
        toolBar.barStyle = .default
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: context.coordinator, action: #selector(context.coordinator.closeKeyBoard))
        
        toolBar.items = [spacer, doneButton]
        toolBar.sizeToFit()
        
        textView.inputAccessoryView = toolBar
        
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
        @objc func closeKeyBoard() {
            parent.onEnd()
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            // checking if text box is empty ..
            // is so then clearing the hint ..
            if textView.text == parent.hint {
                textView.text = ""
                textView.textColor = UIColor(.blue)
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
                textView.textColor = .gray
            }
        }
    }
}

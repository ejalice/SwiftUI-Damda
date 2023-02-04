//
//  AllWrittenView.swift
//  Damda
//
//  Created by eunji on 2023/01/16.
//

import SwiftUI

struct AllWrittenView: View {
    let alarms1 = ["1", "2", "3", "4"]
    let alarms2 = ["5", "6", "7"]
    @State var alarmSelected: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 32) { // 술 - 시간 - 버튼 VStack
                
                Text("00님을 위한 \n술이 준비되었어요!")
                    .foregroundColor(Color.damdaGray100)
                    .Title1()
                
                // 술 정보 ZSTACK
                ZStack{
                    RoundedRectangle(cornerRadius: 16).foregroundColor(Color.damdaGray500)
                    VStack{
                        HStack(spacing: 24) {
                            Image("Bottle_01")
                                .resizable()
                                .frame(width:39, height: 99)
                                .scaledToFit()
                            VStack(alignment: .leading, spacing: 12) {
                                Text("룸주")
                                    .foregroundColor(Color.damdaGray100)
                                    .Title1()
                                Text("2022년 11월 01일 (화)")
                                    .foregroundColor(Color.damdaGray100)
                                    .Body1()
                            }
                            Spacer()
                        }
                        .padding(.bottom, 20)
                        
                        Text("야채 먹기 싫어서 안먹었는데 그거 가지고 하루종일 꼽주네요 야채 안먹어도 살아갈 수 있는데 어이없네요 정말로 진짜 야채 안먹어도 잘 살았는데 왜 그러는걸까요")
                            .Body1()
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                        
                        
                    }
                    .padding(EdgeInsets(top: 32, leading: 32, bottom: 32, trailing: 32))
                }.fixedSize(horizontal: false, vertical: true)
                
                VStack(alignment: .leading, spacing: 20) { // Text - 시간 Stack
                    Text("며칠 후에 이 사건을 다시 꺼내볼까요?")
                        .foregroundColor(Color.damdaGray100)
                        .Title2()
                    
                    VStack(alignment: .leading, spacing: 12) {
                        HStack(spacing: 13) {
                            ForEach(alarms1, id: \.self) { item in
                                Button {
                                    self.alarmSelected = item
                                } label: {
                                    Text("\(item)일 후")
                                        .Body2()
                                        .foregroundColor(item == alarmSelected ? Color.damdaPrimary : Color.damdaGray100)
                                }
                                .buttonStyle(UnselectedButton())
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.damdaPrimary, lineWidth: item == alarmSelected ? 1 : 0)
                                )
                            }
                        }
                        
                        HStack(spacing: 13) {
                            ForEach(alarms2, id: \.self) { item in
                                Button {
                                    self.alarmSelected = item
                                } label: {
                                    Text("\(item)일 후")
                                        .Body2()
                                        .foregroundColor(item == alarmSelected ? Color.damdaPrimary : Color.damdaGray100)
                                }
                                .buttonStyle(UnselectedButton())
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.damdaPrimary, lineWidth: item == alarmSelected ? 1 : 0)
                                )
                            }
                        }
                    }
                }
                .padding(.top, 8.9)
                
                Spacer()
                
                // Button
                NavigationLink (destination: LibraryView()) {
                        Text("도감에 추가하기")
                            .Body1()
                            .foregroundColor(Color.damdaGray100)
                            .frame(width: 358, height: 56)
                            .background(Color.damdaPrimary)
                            .opacity(alarmSelected == "" ? 0.1 : 1)
                            .cornerRadius(16)
                            .padding(.bottom, 24)
                }
                .disabled(alarmSelected.isEmpty)
                
            }
            .padding(.leading, 16)
            .padding(.trailing, 16)
        }
    }
}

struct AllWrittenView_Previews: PreviewProvider {
    static var previews: some View {
        AllWrittenView()
    }
}

struct UnselectedButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .background(Color.damdaGray500)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.damdaPrimary, lineWidth: 0)
            )
    }
}


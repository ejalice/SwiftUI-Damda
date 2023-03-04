//
//  DateView.swift
//  Damda
//
//  Created by eunji on 2022/11/25.
//

import SwiftUI

struct DateView: View {
    @State var selected : String? // 선택한 Button
    @Binding var strengthenScroll: Bool
    @State var items: [String] = ["오늘", "어제", "2일전", "직접선택"]
    @Binding var date: Date
    @Binding var dateSelected: Bool // 날짜 선택했는지 유무

    var dateFormatter: DateFormatter {
           let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 M월 d일"
           return formatter
       }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ForEach(items, id: \.self) { item in
                    Button(action: {
                        self.selected = item
                        if (selected == "직접선택") {
                            strengthenScroll = true
                            
                        } else {
                            strengthenScroll = false
                            date = getDate()
                            dateSelected = true
                        }
                        print(dateSelected)
                    }, label: {
                        Text(item)
                    })
                    .buttonStyle(DateButton())
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(selected == item ? Color.damdaPrimary : Color.damdaGray500, lineWidth: 1)
                    )
                    .foregroundColor(selected == item ? .damdaPrimary : .damdaGray100)
                    .padding(.bottom, 11)
                }
            }
            .padding(.leading, 16)
            

                if (selected == "직접선택") {
                    DatePicker(
                        selection: $date,
                        in: ...Date(),
                        displayedComponents: .date
                    ){
                        Text("Pick Date")
                    }
                    .onChange(of: date, perform: { newValue in
                        dateSelected = true
                    })
                    .environment(\.locale, Locale.init(identifier: "en"))
                    .accentColor(.damdaPrimary)
                    .datePickerStyle(.graphical)
                    .frame(width: 343, height: 351)
                    .background(Color(UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1.0)))
                    .cornerRadius(13)
                    .shadow(color: .white.opacity(0.1), radius: 60, x: 0, y: 10)
                }
            
        }
    }
    

    func getDate() -> Date {
        var dayComponent = DateComponents()
        if selected == "오늘" {
            dayComponent.day = 0
        } else if selected == "어제" {
            dayComponent.day = -1
        } else if selected == "2일전"{
            dayComponent.day = -2
        }
        
        let calendar = Calendar.current
        let nextDay =  calendar.date(byAdding: dayComponent, to: Date())!
        return nextDay
    }
}

struct DateButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .background(Color.damdaGray500)
            .cornerRadius(16)
    }
}

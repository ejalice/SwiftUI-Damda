//
//  DateView.swift
//  Damda
//
//  Created by eunji on 2022/11/25.
//

import SwiftUI

struct DateView: View {
    @Binding var selected : String?
    @Binding var strengthenScroll: Bool
    @State var items: [String] = ["오늘", "어제", "2일전", "직접선택"]
    @State private var date = Date()

    var dateFormatter: DateFormatter {
           let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 M월 d일"
           return formatter
       }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(items, id: \.self) { item in
                    Button(action: {
                        selected = item
                        if (selected == "직접선택") {
                            strengthenScroll.toggle()
                        }
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
            
            if (selected == "직접선택") {
                DatePicker(
                    selection: $date,
                    in: ...Date(),
                    displayedComponents: .date
                ){
                    Text("Pick Date")
                }
                .accentColor(.damdaPrimary)
                .datePickerStyle(.graphical)
                .frame(width: 343, height: 351)
                .background(Color(UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1.0)))
                
                Text(date, formatter: dateFormatter)
            }
            
        }
        
    }
    
}

//struct DateView_Previews: PreviewProvider {
//    static var previews: some View {
//        DateView()
//    }
//}

struct DateButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .background(Color.damdaGray500)
            .cornerRadius(16)
    }
}

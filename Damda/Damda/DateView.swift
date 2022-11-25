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
                    }, label: {
                        Text(item)
                    })
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(selected == item ? Color.damdaPrimary : Color.damdaGray500, lineWidth: 1)
                    )
                    .foregroundColor(selected == item ? .damdaPrimary : .damdaGray100)
                }
            }
            
        }
        
    }
    
}

//struct DateView_Previews: PreviewProvider {
//    static var previews: some View {
//        DateView()
//    }
//}

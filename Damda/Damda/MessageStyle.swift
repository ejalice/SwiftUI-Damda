//
//  MessageStyle.swift
//  Damda
//
//  Created by eunji on 2022/11/23.
//

import SwiftUI

struct DamdaText: View {
    private let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .Subhead()
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
            .background(Color.damdaGray400)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.damdaGray400, lineWidth: 0)
            )
            .foregroundColor(.damdaGray100)
            .padding(.leading, 16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 16)
        
    }
}


struct UserText: View {
    private let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .Subhead()
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
            .background(Color.damdaPrimary)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.damdaPrimary, lineWidth: 0)
            )
            .foregroundColor(.damdaGray100)
            .padding(.trailing, 16)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.bottom, 16)
    }
}

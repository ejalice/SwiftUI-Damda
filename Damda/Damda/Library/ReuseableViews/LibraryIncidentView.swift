//
//  LibraryIncidentView.swift
//  Damda
//
//  Created by 이창형 on 2022/12/06.
//

import SwiftUI

struct LibraryIncidentView: View {
    var titleText: String
    var bottleCount: Int
    var body: some View {
        HStack(spacing: 0) {
            // TODO: 데이터 받아와야함
            Text(titleText)
                .foregroundColor(Color.damdaGray100)
                .Headline()
            
            // TODO: 데이터 받아와야함
            Text("\(bottleCount)개")
                .foregroundColor(Color.damdaGray300)
                .Body2()
                .padding(.leading, 8)
            
            Spacer()
        }
    }
}

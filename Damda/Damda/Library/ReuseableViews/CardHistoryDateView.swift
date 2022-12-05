//
//  CardHistoryDate.swift
//  Damda
//
//  Created by 이창형 on 2022/12/05.
//

import SwiftUI

struct CardHistoryDateView: View {
    var body: some View {
        HStack(spacing: 0) {
            //TODO: 데이터 받아와야 함
            Text("2022년 11월 01일 (화)")
                .Body1()
            Spacer()
            //TODO: 데이터 받아와야 함
            Text("숙성 시작")
                .Body1()
                .foregroundColor(Color.damdaGray300)
        }
    }
}

struct CardHistoryDate_Previews: PreviewProvider {
    static var previews: some View {
        CardHistoryDateView()
    }
}

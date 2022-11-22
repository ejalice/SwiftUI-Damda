//
//  HomeView.swift
//  Damda
//
//  Created by 이창형 on 2022/11/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.damdaBackGround.ignoresSafeArea()
            VStack(spacing: 0) {
                Spacer()
                
                Button {
                    
                } label: {
                    Text("오늘의 사건 작성하기")
                        .font(Font(uiFont: .systemFont(for: .headLine)))
                        .foregroundColor(Color.damdaGray100)
                        .padding(.vertical, 24)
                        .frame(maxWidth: .infinity)
                        .background(Color.damdaPrimary)
                        .cornerRadius(16)
                        .padding(.horizontal, 16)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

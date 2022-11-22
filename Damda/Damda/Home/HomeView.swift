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
                HStack {
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "bell.fill")
                            .foregroundColor(Color.damdaGray300)
                    }
                    .padding(.trailing, 16)
                    .padding(.top, 12)
                }
                
                Spacer()
                
                Button {
                    // TODO: date뷰로 이동
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
                
                Button {
                    
                } label: {
                    Text("도감 읽기")
                        .font(Font(uiFont: .systemFont(for: .headLine)))
                        .foregroundColor(Color.damdaPrimary)
                        .padding(.vertical, 24)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.damdaPrimary, lineWidth: 1)
                                .padding(.horizontal, 16)
                        )
                }
                .padding(.bottom, 44)
                .padding(.top, 20)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

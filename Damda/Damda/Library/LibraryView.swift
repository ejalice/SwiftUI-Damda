//
//  LibraryView.swift
//  Damda
//
//  Created by 이창형 on 2022/11/22.
//

import SwiftUI

struct LibraryView: View {
    @Environment(\.presentationMode) var presentationMode
    // 숙성 중
    @State private var ripeningEnable = false
    // 숙성 완료
    @State private var maturedEnable = false
    // 미제 사건
    @State private var mysteryEnable = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.damdaBackGround.ignoresSafeArea()
                VStack(spacing: 0) {
                    HStack {
                        Button {
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "arrow.backward")
                                .foregroundColor(Color.damdaGray200)
                                .bold()
                        }
                        .padding(.leading, 18)
                        .padding(.top, 12)
                        
                        Spacer()
                    }
                    ScrollView {
                        VStack(spacing: 0) {
                            HStack {
                                LibraryIncidentView()
                                    .padding(.top, 28)
                                Button {
                                    ripeningEnable.toggle()
                                    if ripeningEnable {
                                        // 등장
                                    } else {
                                        // 삭제
                                    }
                                } label: {
                                    if ripeningEnable {
                                        Image(systemName: "chevron.down")
                                            .foregroundColor(Color.damdaGray200)
                                            .bold()
                                            .padding(.top, 25)
                                    } else {
                                        Image(systemName: "chevron.up")
                                            .foregroundColor(Color.damdaGray200)
                                            .bold()
                                            .padding(.top, 25)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 16)

                        
                    }
                }
            }
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}

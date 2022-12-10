//
//  LibraryView.swift
//  Damda
//
//  Created by 이창형 on 2022/11/22.
//

import SwiftUI

struct LibraryView: View {
    let model = Model()
    
    @Environment(\.presentationMode) var presentationMode
    // 숙성 중
    @State private var ripeningEnable = false
    // 숙성 완료
    @State private var maturedEnable = false
    // 미제 사건
    @State private var mysteryEnable = false
    @State private var ripeningString = "숙성중인 사건"
    @State private var maturedString = "숙성 완료된 사건"
    @State private var mysteryString = "미제 사건"
    
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
                                LibraryIncidentView(titleText: ripeningString, bottleCount: model.ripeningBottleImageArray.count)
                                    .padding(.top, 28)
                                Button {
                                    ripeningEnable.toggle()
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
                            if ripeningEnable {
                                // 등장
                                LibraryDetailView(imageArray: model.ripeningBottleImageArray)
                                    .padding(.top, 16)
                            } else {
                                // 삭제
                            }
                            HStack {
                                LibraryIncidentView(titleText: maturedString, bottleCount: model.maturedBottleImageArray.count)
                                    .padding(.top, 28)
                                Button {
                                    maturedEnable.toggle()
                                    if maturedEnable {
                                        // 등장
                                    } else {
                                        // 삭제
                                    }
                                } label: {
                                    if maturedEnable {
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
                            if maturedEnable {
                                // 등장
                                LibraryDetailView(imageArray: model.maturedBottleImageArray)
                                    .padding(.top, 16)
                            } else {
                                // 삭제
                            }
                            HStack {
                                LibraryIncidentView(titleText: mysteryString, bottleCount: model.mysteryBottleImageArray.count)
                                    .padding(.top, 28)
                                Button {
                                    mysteryEnable.toggle()
                                    if mysteryEnable {
                                        // 등장
                                    } else {
                                        // 삭제
                                    }
                                } label: {
                                    if mysteryEnable {
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
                            if mysteryEnable {
                                // 등장
                                LibraryDetailView(imageArray: model.mysteryBottleImageArray)
                                    .padding(.top, 16)
                            } else {
                                // 삭제
                            }
                        }
                        .padding(.horizontal, 16)
                        .animation(SwiftUI.Animation.easeInOut(duration: 0.4), value: ripeningEnable)
                        .animation(SwiftUI.Animation.easeInOut(duration: 0.4), value: maturedEnable)
                        .animation(SwiftUI.Animation.easeInOut(duration: 0.4), value: mysteryEnable)
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

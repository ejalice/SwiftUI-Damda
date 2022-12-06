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
                        }
                        .padding(.leading, 18)
                        .padding(.top, 12)
                        Spacer()
                    }
                    Spacer()
                    ScrollView {

                        
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

//
//  LibraryDetailView.swift
//  Damda
//
//  Created by 이창형 on 2022/12/06.
//

import SwiftUI

struct LibraryDetailView: View {
    let model = Model()
    let rows = [GridItem(.fixed(212))]
    var body: some View {
        LazyHGrid(rows: rows , spacing: 20) {
            ForEach(model.maturedBottleImageArray, id: \.self) {
                Image("\($0)")
                    .resizable()
                    .frame(width: 169)
                    .scaledToFit()
                    .cornerRadius(10)
            }
        }
    }
}

struct LibraryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryDetailView()
    }
}

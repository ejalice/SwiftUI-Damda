//
//  LibraryDetailView.swift
//  Damda
//
//  Created by 이창형 on 2022/12/06.
//

import SwiftUI

struct LibraryDetailView: View {
    let model = Model()
    let columns = Array(repeating: GridItem(.adaptive(minimum: 112, maximum: 112)), count: 3)
    var body: some View {
        
        LazyVGrid(columns: columns, alignment: .center){
            ForEach(model.ripeningBottleImageArray, id: \.self) {
                Image("\($0)")
                    .resizable()
                    .frame(height: 140)
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

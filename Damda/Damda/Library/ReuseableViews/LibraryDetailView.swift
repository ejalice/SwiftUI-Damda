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
    
    @State var isDetailTapped = false
    var imageArray: Array<Drink>
    
    var body: some View {
        LazyVGrid(columns: columns, alignment: .center){
            ForEach(self.imageArray, id: \.self) { drink in
                NavigationLink{
                    DetailView(drink: drink)
                } label: {
                    Rectangle()
                        .cornerRadius(16)
                        .foregroundColor(Color.damdaGray500)
                        .frame(height: 140)
                        .overlay(
                            VStack(spacing: 0) {
                                Image("\(drink.imageName ?? "")")
                                    .resizable()
                                    .frame(width: 30 ,height: 70)
                                    .scaledToFit()
                                    .padding(.top, 10)
                                // TODO: 데이터 받아와야 함
                                Text("\(drink.drinkName ?? "")주")
                                    .foregroundColor(Color.damdaGray100)
                                    .Subhead()
                                    .padding(.top, 5)
                                
                                // TODO: 데이터 받아와야 함
                                Text("D-4")
                                    .foregroundColor(Color.damdaGray300)
                                    .Footnote()
                                Spacer()
                            }
                        )
                }
            }
        }
    }
}

//
//  Extension+Color.swift
//  Damda
//
//  Created by 이창형 on 2022/11/12.
//

import SwiftUI

extension Color {
  init(hex: String) {
    let scanner = Scanner(string: hex)
    _ = scanner.scanString("#")
    
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    
    let r = Double((rgb >> 16) & 0xFF) / 255.0
    let g = Double((rgb >>  8) & 0xFF) / 255.0
    let b = Double((rgb >>  0) & 0xFF) / 255.0
    self.init(red: r, green: g, blue: b)
  }
    static let damdaBackGround = Color(hex: "1B1C1E")
    static let damdaPrimary = Color(hex: "FF7866")
    static let damdaPrimaryLight = Color(hex: "FF7866").opacity(0.1)
    static let damdaGray100 = Color(hex: "FBFCFF")
    static let damdaGray200 = Color(hex: "C2C7D3")
    static let damdaGray300 = Color(hex: "878C97")
    static let damdaGray400 = Color(hex: "585A60")
    static let damdaGray500 = Color(hex: "323439")
    static let damdaGray600 = Color(hex: "1F2125")
}

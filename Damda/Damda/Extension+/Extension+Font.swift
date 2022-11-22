//
//  Extension+Font.swift
//  Damda
//
//  Created by 이창형 on 2022/11/12.
//

import Foundation
import UIKit
import SwiftUI

extension UIFont {
    static func systemFont(for customStyle: CustomTextStyle) -> UIFont {
        var customFont: UIFont!
        switch customStyle {
        case .largeTitle:
            customFont = UIFont(name: CustomFont.appleSDBold.name, size: 34)!
        case .title01:
            customFont = UIFont(name: CustomFont.appleSDSemiBold.name, size: 28)!
        case .title02:
            customFont = UIFont(name: CustomFont.appleSDRegular.name, size: 22)!
        case .headLine:
            customFont = UIFont(name: CustomFont.appleSDBold.name, size: 17)!
        case .body01:
            customFont = UIFont(name: CustomFont.appleSDRegular.name, size: 17)!
        case .body02:
            customFont = UIFont(name: CustomFont.appleSDRegular.name, size: 15)!
        case .subHead:
            customFont = UIFont(name: CustomFont.appleSDMedium.name, size: 15)!
        case .footNote:
            customFont = UIFont(name: CustomFont.appleSDRegular.name, size: 13)!
        }
        return customFont
    }
}

enum CustomFont {
    case appleSDBold
    case appleSDSemiBold
    case appleSDMedium
    case appleSDRegular
    
    var name: String {
        switch self {
        case .appleSDBold:
            return "AppleSDGothicNeo-Bold"
        case .appleSDSemiBold:
            return "AppleSDGothicNeo-SemiBold"
        case .appleSDMedium:
            return "AppleSDGothicNeo-Medium"
        case .appleSDRegular:
            return "AppleSDGothicNeo-Regular"
        }
    }
}

enum CustomTextStyle {
    case largeTitle
    case title01
    case title02
    case headLine
    case body01
    case body02
    case subHead
    case footNote
}

// MARK: SwiftUI Font extension
// .font(Font(uiFont: .systemFont(for: .body2)))
extension Font {
    init(uiFont: UIFont) {
        self = Font(uiFont as CTFont)
    }
}

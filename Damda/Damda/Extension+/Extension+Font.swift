//
//  Extension+Font.swift
//  Damda
//
//  Created by 이창형 on 2022/11/12.
//

import SwiftUI

extension UIFont {
    static var LargeTitle = UIFont.systemFont(ofSize: 34, weight: .bold)
    static var Title1 = UIFont.systemFont(ofSize: 28, weight: .semibold)
    static var Title2 = UIFont.systemFont(ofSize: 22, weight: .regular)
    static var Headline = UIFont.systemFont(ofSize: 17, weight: .bold)
    static var Body1 = UIFont.systemFont(ofSize: 17, weight: .regular)
    static var Body2 = UIFont.systemFont(ofSize: 15, weight: .regular)
    static var Subhead = UIFont.systemFont(ofSize: 15, weight: .medium)
    static var Footnote = UIFont.systemFont(ofSize: 13, weight: .regular)
}

struct FontWithLineHeight: ViewModifier {
    let font: UIFont
    let lineHeight: CGFloat

    func body(content: Content) -> some View {
        content
            .font(Font(font))
            .lineSpacing(lineHeight - font.lineHeight)
            .padding(.vertical, (lineHeight - font.lineHeight) / 2)
    }
}

extension View {
    //크기를 적용할 Text또는 Image에 Text().LargeTitle()과 같은 형식으로 사용해주세요
    func LargeTitle() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .LargeTitle, lineHeight: 40))
    }
    func Title1() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .Title1, lineHeight: 32))
    }
    func Title2() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .Title2, lineHeight: 28))
    }
    func Headline() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .Headline, lineHeight: 24))
    }
    func Body1() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .Body1, lineHeight: 24))
    }
    func Body2() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .Body2, lineHeight: 20))
    }
    func Subhead() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .Subhead, lineHeight: 20))
    }
    func Footnote() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .Footnote, lineHeight: 16))
    }
}

//
//  FontMaker.swift
//  MyPokedexSwiftUI
//
//  Created by Bruno Marques on 02/02/24.
//

import Foundation
import SwiftUI

public enum FontNames: String {
    case poppinsRegular = "Poppins-Regular"
    case poppinsLight = "Poppins-Light"
    case poppinsBold = "Poppins-Bold"
    case poppinsMedium = "Poppins-Medium"
    case poppinsSemiBold = "Poppins-SemiBold"
}

struct FontMaker {
    static func makeFont(_ font: FontNames, _ size: CGFloat) -> Font {
        Font.custom(font.rawValue, size: size)
    }
}

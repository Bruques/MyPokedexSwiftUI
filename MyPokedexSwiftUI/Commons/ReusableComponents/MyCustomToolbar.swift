//
//  MyCustomToolbar.swift
//  MyPokedexSwiftUI
//
//  Created by Bruno Marques on 25/02/24.
//

import Foundation
import SwiftUI

struct MyCustomToolbar: ViewModifier {
    @Environment(\.dismiss) var dismiss
    var title: String
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .tint(PokedexColors.primary)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .font(FontMaker.makeFont(.poppinsSemiBold,
                                                 18))
                }
            }
    }
}

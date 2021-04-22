//
//  Fonts.swift
//  Bootcamp
//
//  Created by denis.fortuna on 16/04/21.
//

import UIKit

enum Fonts {
    case regular(size: CGFloat)
    case bold(size: CGFloat)
}

extension Fonts {
    var path: UIFont {
        switch self {
        case .bold(let size):
            guard let font = UIFont(name: "Roboto-Bold", size: size) else { return UIFont() }
            return font
        case .regular(let size):
            guard let font = UIFont(name: "Roboto-Regular", size: size) else { return UIFont() }
            return font
        }
    }
}

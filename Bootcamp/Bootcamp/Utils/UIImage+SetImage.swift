//
//  UIImage+SetImage.swift
//  Bootcamp
//
//  Created by denis.fortuna on 22/04/21.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(url: URL?) {
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url)
    }
}

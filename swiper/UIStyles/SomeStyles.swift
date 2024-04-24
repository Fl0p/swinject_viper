//
//  Kek.swift
//  swiper
//
//  Created by Flop on 23.04.2024.
//

import Foundation
import UIKit

extension UIView {
    func styleBgLightGray() {
        self.backgroundColor = .lightGray
    }

    func styleBgGray() {
        self.backgroundColor = .gray
    }
    
    func styleBgRed() {
        self.backgroundColor = .red
    }
    
}

extension UIButton {
    func styleLol() {
        self.backgroundColor = .blue
        self.setTitle("LOL", for: .normal)
    }
    
    func styleKek() {
        self.backgroundColor = .red
        self.setTitle("KEK", for: .normal)
    }
}

extension UILabel {
    func styleLbl() {
        self.backgroundColor = .white
        self.textColor = .darkText
    }
}

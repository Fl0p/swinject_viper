//
//  LoadingView.swift
//  swiper
//
//  Created by Flop on 18.04.2024.
//

import Foundation
import UIKit
import Stevia

protocol LoadingViewProtocol: ViewProtocol {
    var btn: UIButton { get }
    var bc: UIColor { get }
}

final class LoadingView: ViewBase, LoadingViewProtocol {
    
    let btn: UIButton = UIButton()
    
    var bc: UIColor {
        self.backgroundColor ?? .blue
    }
    
    override func commonInit() {
        self.backgroundColor = .lightGray
        
        subviews {
            btn
        }
    }
    
}

final class LoadingViewController: ViewController<LoadingView, LoadingPresenter> {
    
}

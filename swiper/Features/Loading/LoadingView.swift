//
//  LoadingView.swift
//  swiper
//
//  Created by Flop on 18.04.2024.
//

import Foundation
import UIKit

protocol LoadingViewProtocol: ViewProtocol {
    var bc: UIColor { get }
}

final class LoadingView: ViewBase, LoadingViewProtocol {
    var bc: UIColor {
        self.backgroundColor ?? .blue
    }
    
    override func commonInit() {
        self.backgroundColor = .lightGray
    }
    
}

final class LoadingViewController: ViewController<LoadingView, LoadingPresenter> {
    
}

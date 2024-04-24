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
    var square: UIView { get }
    var lbl: UILabel { get }
    var act: UIActivityIndicatorView { get }

}

final class LoadingView: VIPERView, LoadingViewProtocol {
    
    let square: UIView = UIView()
    let lbl: UILabel = UILabel()
    let act: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
    
    
    var bc: UIColor {
        self.backgroundColor ?? .blue
    }
    
    override func applyStyle() {
        self.styleBgLightGray()
        square.styleBgGray()
        lbl.text = "Loading..."
        lbl.textColor = .black
    }
    
    override func applyLayout() {
        self.subviews {
            square
            lbl
            act
        }
        act.centerInContainer()
        
        square.Top == self.safeAreaLayoutGuide.Top + 20
        layout {
            |-square-| ~ 50
            10
            |-lbl-| ~ 50
            >=80
        }
    }
}

final class LoadingViewController: ViewController<LoadingView, LoadingPresenter> {
    
}

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
    var lbl: UILabel { get }
    var act: UIActivityIndicatorView { get }

}

final class LoadingView: VIPERView, LoadingViewProtocol {
    
    let lbl: UILabel = UILabel()
    let act: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
    
    
    override func applyStyle() {
        self.styleBgLightGray()
        lbl.styleLbl()
    }
    
    override func applyLayout() {
        self.subviews {
            lbl
            act
        }
        act.centerInContainer()
        
        lbl.Top == self.safeAreaLayoutGuide.Top + 20
        layout {
            |-lbl-| ~ 50
        }
    }
}

final class LoadingViewController: ViewController<LoadingView, LoadingPresenter> {
    
}

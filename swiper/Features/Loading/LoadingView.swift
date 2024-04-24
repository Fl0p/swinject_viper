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
    var lolBtn: UIButton { get }
    var kekBtn: UIButton { get }
    var bc: UIColor { get }
}

final class LoadingView: VIPERView, LoadingViewProtocol {
    
    let lolBtn: UIButton = UIButton()
    let kekBtn: UIButton = UIButton()
    let square: UIView = UIView()
    
    var bc: UIColor {
        self.backgroundColor ?? .blue
    }
    
    override func applyStyle() {
        self.styleBgLightGray()
        square.styleBgGray()
        lolBtn.styleLol()
        kekBtn.styleKek()
    }
    
    override func applyLayout() {
        self.subviews {
            square
            lolBtn
            kekBtn
        }
        square.Top == self.safeAreaLayoutGuide.Top + 20
        layout {
            |-square-| ~ 50
            10
            |-lolBtn-| ~ 50
            10
            |-kekBtn-| ~ 50
            >=80
        }
    }
}

final class LoadingViewController: ViewController<LoadingView, LoadingPresenter> {
    
}

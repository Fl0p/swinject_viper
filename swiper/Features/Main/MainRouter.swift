//
//  MainRouter.swift
//  swiper
//
//  Created by Flop on 24.04.2024.
//

import Foundation
import UIKit

protocol MainRouterProtocol: RouterProtocol {
    func kek()
    func lol(_ str: String)
}

enum MainRoute: Route {
    case kek
    case lol(String)
    case aza(Int)
}

final class MainRouter: VIPERRouter<UINavigationController>, MainRouterProtocol {
    
    override func onStart(root:RVC, own: (any ViewControllerProtocol)) {
        super.onStart(root: root, own: own)
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.fade
        self.root?.view.layer.add(transition, forKey: kCATransition)
        self.root?.setViewControllers([own], animated: false)
    }
    
    func kek() {
        self.handleRoute(MainRoute.kek)
    }
    
    func lol(_ str: String) {
        self.handleRoute(MainRoute.lol(str))
    }
    
}

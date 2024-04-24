//
//  LoadingRouter.swift
//  swiper
//
//  Created by Flop on 18.04.2024.
//

import Foundation
import UIKit

protocol LoadingRouterProtocol: RouterProtocol {
    func loaded(_ num: Int)
}

enum LoadingRoute: Route {
    case loaded(Int)
}

final class LoadingRouter: VIPERRouter<UINavigationController>, LoadingRouterProtocol {
    
    override func onStart(root: RootViewController, own: UIViewController) {
        super.onStart(root: root, own: own)
        root.setViewControllers([own], animated: true)
    }
    
    func loaded(_ num: Int) {
        let route = LoadingRoute.loaded(num)
        let vc = self.handleRoute(route)
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.fade
        self.root?.view.layer.add(transition, forKey: kCATransition)
        self.root?.setViewControllers([vc], animated: false)
    }
    
}

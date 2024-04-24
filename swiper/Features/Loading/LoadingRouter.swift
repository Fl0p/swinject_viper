//
//  LoadingRouter.swift
//  swiper
//
//  Created by Flop on 18.04.2024.
//

import Foundation
import UIKit

protocol LoadingRouterProtocol: RouterProtocol {
    func kek()
    func lol(_ str: String)
}

enum LoadingRoute: Route {
    case kek
    case lol(String)
    case aza(Int)
}

final class LoadingRouter: VIPERRouter<UINavigationController>, LoadingRouterProtocol {
    
    override func onStart(ownVC: UIViewController) {
        super.onStart(ownVC: ownVC)
        self.root.setViewControllers([ownVC], animated: true)
    }
    
    func kek() {
        let route = LoadingRoute.kek
        let vc = self.route(route)
        self.root.pushViewController(vc, animated: true)
    }
    
    func lol(_ str: String) {
        let route = LoadingRoute.lol(str)
        let vc = self.route(route)
        self.root.pushViewController(vc, animated: true)
    }
    
}

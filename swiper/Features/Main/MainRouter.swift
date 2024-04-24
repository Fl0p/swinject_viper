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
    
    override func onStart(root:RootViewController, own: UIViewController) {
        super.onStart(root: root, own: own)
        root.setViewControllers([own], animated: true)
    }
    
    func kek() {
        let route = MainRoute.kek
        let vc = self.handleRoute(route)
        self.root?.pushViewController(vc, animated: true)
    }
    
    func lol(_ str: String) {
        let route = MainRoute.lol(str)
        let vc = self.handleRoute(route)
        self.root?.pushViewController(vc, animated: true)
    }
    
}

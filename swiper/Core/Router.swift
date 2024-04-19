//
//  Router.swift
//  swiper
//
//  Created by Flop on 18.04.2024.
//

import Foundation
import UIKit

struct Route: Hashable {
    let path: String
    let title: String
}

typealias RouteHandler = (Route) -> UIViewController

open class Router {
    
    let root: UINavigationController
    weak var own: UIViewController?
    
    var routes:[Route:RouteHandler] = [:]
    
    init(root: UINavigationController) {
        self.root = root
    }

    open func start() {
        print("Router start")
    }
    
    func getViewControllerForRoute(route: Route) -> UIViewController? {
        
        guard let handler = self.routes[route] else {
            return nil
        }

        return handler(route)
    }
    
    func navigateToText(text:String) {
        let route = Route(path: "text", title: text)

        guard let vc = self.getViewControllerForRoute(route: route) else {
            return
        }
        vc.title = text
        self.root.pushViewController(vc, animated: true)
    }
    
    func navigateToMain() {
        self.root.popToRootViewController(animated: true)
        print("Navigate to main")
    }
}

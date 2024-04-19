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

protocol RouterProtocol {
    var root: UINavigationController { get }
    var own: UIViewController? { get set }
    
    init(root: UINavigationController)
    func start(own: UIViewController)
    func onStart()
}

open class RouterBase {
    
    let root: UINavigationController
    weak var own: UIViewController?
    
    var routes:[Route:RouteHandler] = [:]
    
    init(root: UINavigationController) {
        self.root = root
    }

    open func start(own: UIViewController) {
        self.own =  own
        self.onStart()
    }
    
    open func onStart() {
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
        print("Navigate to main")
        self.root.popToRootViewController(animated: true)
    }
}

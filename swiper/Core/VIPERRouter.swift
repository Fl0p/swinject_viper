//
//  Router.swift
//  swiper
//
//  Created by Flop on 18.04.2024.
//

import Foundation
import UIKit

public protocol Route: Hashable {
    
}


public protocol RouterProtocol {
    associatedtype RootViewController: UIViewController
    var root: RootViewController? { get }
    var own: UIViewController? { get }
    init()
    func onStart(root: RootViewController, own: UIViewController)
}

open class VIPERRouter<C>: RouterProtocol where C: UIViewController {
    public typealias RootViewController = C
    public weak var root: RootViewController?
    public weak var own: UIViewController?
    
    var routes:[ObjectIdentifier: (any Route) -> UIViewController] = [:]
    
    required public init() {
        
    }

    open func onStart(root:RootViewController, own: UIViewController) {
        print("Router start: \(self) \(root) \(own)")
    }
    
    func addRoute<R: Route>(_ routeType: R.Type, handler: @escaping (R) -> UIViewController) {
        routes[ObjectIdentifier(routeType)] = { route in
            if let specificRoute = route as? R {
                return handler(specificRoute)
            } else {
                fatalError("Unexpected route: \(route)")
            }
        }
    }
       
    func handleRoute(_ route: any Route) -> UIViewController {
        let identifier = ObjectIdentifier(type(of: route))
        if let handler = routes[identifier] {
            return handler(route)
        } else {
            fatalError("Unsupported route: \(route)")
        }
    }
    
}

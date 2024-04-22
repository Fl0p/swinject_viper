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
    associatedtype RootViewController
    var root: RootViewController { get }
    var own: UIViewController? { get set }
    
    init(root: RootViewController)
    func start(own: UIViewController)
    func onStart()
}

open class RouterBase<C>: RouterProtocol {
    public typealias RootViewController = C
    public let root: RootViewController
    weak public var own: UIViewController?
    
    var routes:[ObjectIdentifier: (any Route) -> UIViewController] = [:]
    
    required public init(root: RootViewController) {
        self.root = root
    }

    open func start(own: UIViewController) {
        self.own =  own
        self.onStart()
    }
    
    open func onStart() {
        print("Router start")
    }
    
    func addRoute<R: Route>(_ routeType: R.Type, handler: @escaping (any Route) -> UIViewController) {
        routes[ObjectIdentifier(routeType)] = { route in
            if let specificRoute = route as? R {
                return handler(specificRoute)
            } else {
                fatalError("Unexpected route: \(route)")
            }
        }
    }
       
    func route(_ route: any Route) -> UIViewController {
        let identifier = ObjectIdentifier(type(of: route))
        if let handler = routes[identifier] {
            return handler(route)
        } else {
            fatalError("Unsupported route: \(route)")
        }
    }
    
}

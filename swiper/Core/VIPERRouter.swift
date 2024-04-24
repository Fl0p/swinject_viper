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
    associatedtype RVC: UIViewController
    var root: RVC? { get }
    var own: (any ViewControllerProtocol)? { get }
    init()
    func onStart(root: RVC, own: (any ViewControllerProtocol))
}

open class VIPERRouter<C>: RouterProtocol where C: UIViewController {
    
    public typealias RVC = C
    public weak var root: RVC?
    public weak var own: (any ViewControllerProtocol)?
    
    typealias Handler = (VIPERRouter<C>, any Route) -> Void
    
    var routes:[ObjectIdentifier: Handler] = [:]
    
    required public init() {
        
    }

    open func onStart(root:RVC, own: (any ViewControllerProtocol)) {
        self.root = root
        self.own = own
        print("Router start: \(self) \(root) \(own)")
    }
    
    func addRoute<R: Route>(
        _ r: R.Type,
        handler: @escaping (VIPERRouter<C>, R) -> Void
    ) {
        routes[ObjectIdentifier(r)] = { router, route in
            if let specificRoute = route as? R {
                handler(router, specificRoute)
            } else {
                fatalError("Unexpected route: \(route)")
            }
        }
    }
       
    func handleRoute(_ route: any Route) -> Void {
        let identifier = ObjectIdentifier(type(of: route))
        guard let handler = routes[identifier] else {
            fatalError("Unsupported route: \(route)")
        }
        handler(self, route)
    }
    
}

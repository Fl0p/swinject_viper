import Foundation
import UIKit

public protocol Route {}

public protocol RouterProtocol {
    associatedtype RootType: UIViewController
    var root: RootType? { get }
    var own: (any ViewControllerProtocol)? { get }
    init()
    func onStart(root: RootType, own: (any ViewControllerProtocol))
}

open class VIPERRouter<R: Route, C: UIViewController>: RouterProtocol {
    
    internal struct RouteKey: Hashable, Equatable {
        internal let identifier: ObjectIdentifier
        
        init(_ routeType: Any.Type) {
            self.identifier = ObjectIdentifier(routeType)
        }
        
        public func hash(into hasher: inout Hasher) {
            identifier.hash(into: &hasher)
        }
        
        static func == (lhs: RouteKey, rhs: RouteKey) -> Bool {
            return lhs.identifier == rhs.identifier
        }
    }
    
    public typealias SelfType = VIPERRouter<R, C>
    public typealias RouteType = R
    public typealias RootType = C
    
    public weak var root: RootType?
    public weak var own: (any ViewControllerProtocol)?
    
    typealias Handler = (SelfType, RouteType) -> Void
    
    var routes:[RouteKey: Handler] = [:]
    
    required public init() {}

    open func onStart(root: RootType, own: (any ViewControllerProtocol)) {
        self.root = root
        self.own = own
    }
    
    func addRoute<RouteType> (
        _ route: RouteType.Type,
        handler: @escaping (SelfType, RouteType) -> Void
    ) {
        let key = RouteKey(RouteType.self)
        routes[key] = { router, route in
            handler(router, route as! RouteType)
        }
    }
       
    func handleRoute(_ route: RouteType) -> Void {
        let key = RouteKey(type(of: route))
        guard let handler = routes[key] else {
            fatalError("Unsupported route: \(route)")
        }
        handler(self, route)
    }
    
}

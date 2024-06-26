//
//  Presenter.swift
//  swiper
//
//  Created by Flop on 18.04.2024.
//

import Foundation
import RxSwift

public protocol PresenterProtocol: AnyObject {
    associatedtype View: ViewProtocol
    associatedtype Interactor: InteractorProtocol
    associatedtype Router: RouterProtocol
    var view: View? { get }
    var interactor: Interactor { get }
    var router: Router { get }
    func viewReady(view: View)
}

class VIPERPresenter<V, I, R>: PresenterProtocol
where V: ViewProtocol, I: InteractorProtocol, R:RouterProtocol {
    typealias View = V
    typealias Interactor = I
    typealias Router = R
    
    weak var view: V?
    let interactor: Interactor
    let router: Router
    let disposeBag = DisposeBag()
    
    init(interactor: Interactor, router: Router) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewReady(view: V) {
        self.view = view
        self.bind()
        self.interactor.ready()
    }
    
    open func bind() {
        
    }
}

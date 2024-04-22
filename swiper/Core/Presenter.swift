//
//  Presenter.swift
//  swiper
//
//  Created by Flop on 18.04.2024.
//

import Foundation
import RxSwift

protocol AnyPresenterProtocol: AnyObject {
    associatedtype View
    var view: View? { set get }
    func viewReady(view: View)
}

protocol PresenterProtocol: AnyPresenterProtocol {
    
    associatedtype Interactor
    associatedtype Router

    var interactor: Interactor { get }
    var router: Router { get }

}


class PresenterBase<V, I, R>: PresenterProtocol {
    typealias View = V
    typealias Interactor = I
    typealias Router = R
    
    var view: V?
    let interactor: Interactor
    let router: Router
    let disposeBag = DisposeBag()
    
    init(interactor: Interactor, router: Router) {
        self.interactor = interactor
        self.router = router
    }
    
    open func viewReady(view: V) {
        self.view = view
        //self.interactor.presenter = self as? I.Presenter
        self.bind()
    }
    
    open func bind() {
        
    }
}

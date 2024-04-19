//
//  Presenter.swift
//  swiper
//
//  Created by Flop on 18.04.2024.
//

import Foundation
import RxSwift

protocol PresenterProtocol {
    associatedtype V: View
    func viewReady(view: V)
}

open class Presenter<V: View,R,I>: PresenterProtocol {
    var view: V?
    let router: R
    let interactor: I
    let disposeBag = DisposeBag()
    
    public init(router: R, interactor: I) {
        self.router = router
        self.interactor = interactor
    }
    
    open func viewReady(view: V) {
        self.view = view
        self.bind()
    }
    
    open func bind() {
        
    }
}

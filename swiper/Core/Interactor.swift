//
//  Interactor.swift
//  swiper
//
//  Created by Flop on 19.04.2024.
//

import Foundation

protocol InteractorProtocol {
    associatedtype Presenter
    var presenter: Presenter? { get set }
}


open class InteractorBase<P>: InteractorProtocol {
    typealias Presenter = P
    var presenter: Presenter?
}

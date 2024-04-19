//
//  Interactor.swift
//  swiper
//
//  Created by Flop on 19.04.2024.
//

import Foundation

protocol InteractorProtocol: AnyObject {
    associatedtype P
    var presenter: P? { get set }
}

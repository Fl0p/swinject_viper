//
//  Interactor.swift
//  swiper
//
//  Created by Flop on 19.04.2024.
//

import Foundation

protocol InteractorProtocol {
    func ready()
}

class VIPERInteractor: InteractorProtocol {
    open func ready() {
        // override this method in subclass
    }
}

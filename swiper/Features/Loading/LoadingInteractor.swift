//
//  LoadingInteractor.swift
//  swiper
//
//  Created by Flop on 18.04.2024.
//

import Foundation
import RxSwift

protocol LoadingInteractorProtocol: InteractorProtocol {
    func loaded()
    var loadedTrigger: PublishSubject<Void> { get }
}

final class LoadingInteractor: VIPERInteractor, LoadingInteractorProtocol {
    
    let loadedTrigger = PublishSubject<Void>()

    override func ready() {
        super.ready()
    }
    
    func loaded() {
        // just some async operation
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.loadedTrigger.onNext(())
        }
    }
}

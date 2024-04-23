//
//  LoadingInteractor.swift
//  swiper
//
//  Created by Flop on 18.04.2024.
//

import Foundation
import RxSwift

protocol LoadingInteractorProtocol: InteractorProtocol {
    func lol()
    var lolEventTrigger: PublishSubject<Void>? { get }
}

final class LoadingInteractor: InteractorBase, LoadingInteractorProtocol {
    
    var lolEventTrigger: PublishSubject<Void>? = {
        return PublishSubject<Void>()
    }()
    
    func lol() {
        print("LoadingInteractor lol")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.lolEventTrigger?.onNext(())
        }
    }
}

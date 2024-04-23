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
    func kek()
    
    var lolEventTrigger: PublishSubject<Void> { get }
    var kekEventTrigger: PublishSubject<Void> { get }
}

final class LoadingInteractor: InteractorBase, LoadingInteractorProtocol {
    
    let lolEventTrigger = PublishSubject<Void>()
    let kekEventTrigger = PublishSubject<Void>()

    func lol() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.lolEventTrigger.onNext(())
        }
    }
    func kek() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.kekEventTrigger.onNext(())
        }
    }
    

}

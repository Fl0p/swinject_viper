//
//  MainInteractor.swift
//  swiper
//
//  Created by Flop on 24.04.2024.
//

import Foundation
import RxSwift

protocol MainInteractorProtocol: InteractorProtocol {
    func lol()
    func kek()
    
    var lolEventTrigger: PublishSubject<Void> { get }
    var kekEventTrigger: PublishSubject<Void> { get }
}

final class MainInteractor: VIPERInteractor, MainInteractorProtocol {
    
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

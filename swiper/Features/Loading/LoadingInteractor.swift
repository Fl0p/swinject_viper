//
//  LoadingInteractor.swift
//  swiper
//
//  Created by Flop on 18.04.2024.
//

import Foundation
import RxSwift
import RxRelay

protocol LoadingInteractorProtocol: InteractorProtocol {
    func loaded()
    var loadedTrigger: PublishSubject<Void> { get }
    var loading: BehaviorRelay<Bool> { get }
    var string: BehaviorRelay<String> { get }
    var num: Int { get }
}

final class LoadingInteractor: VIPERInteractor, LoadingInteractorProtocol {
    
    let loadedTrigger = PublishSubject<Void>()
    let loading = BehaviorRelay<Bool>(value: false)
    let string = BehaviorRelay<String>(value: "")
    var num = 0
    
    override func ready() {
        super.ready()
        string.accept("Loading...")
        loading.accept(true)
        num = 1+Int(arc4random_uniform(7))
        tock()
    }
    
    func tick() {
        num -= 1
        string.accept("Loading...\(num)")
        if num == 0 {
            loaded()
        } else {
            tock()
        }
    }
    
    func tock() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.tick()
        }
    }
    
    func loaded() {
        // just some async operation
        string.accept("Loaded")
        loading.accept(false)
        num = 1+Int(arc4random_uniform(7))
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.loadedTrigger.onNext(())
        }
    }
}

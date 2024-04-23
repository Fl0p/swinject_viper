//
//  LoadingPresenter.swift
//  swiper
//
//  Created by Flop on 18.04.2024.
//

import Foundation
import RxSwift
import RxCocoa

class LoadingPresenter: PresenterBase<LoadingView, LoadingInteractorProtocol, LoadingRouter> {
    override func bind() {
        let c = self.view?.bc ?? .black
        print("LoadingPresenter bind \(c)")
        
        interactor.lolEventTrigger.subscribe(onNext: { [weak self] in
            print("LoadingInteractor lol")
            self?.router.lol("lol")
        }).disposed(by: self.disposeBag)

        interactor.kekEventTrigger.subscribe(onNext: { [weak self] in
            print("LoadingInteractor kek")
            self?.router.kek()
        }).disposed(by: self.disposeBag)

        
        self.view?.lolBtn.rx.tap
        .subscribe(onNext: { [weak self] in
            self?.interactor.lol()
        }).disposed(by: self.disposeBag)
        
        self.view?.kekBtn.rx.tap
        .subscribe(onNext: { [weak self] in
            self?.interactor.kek()
        }).disposed(by: self.disposeBag)

        
    }
    
    func kek() {
        print("LoadingPresenter kek")
        self.router.kek()
    }
}

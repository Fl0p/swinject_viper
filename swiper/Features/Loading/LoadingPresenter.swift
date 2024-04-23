//
//  LoadingPresenter.swift
//  swiper
//
//  Created by Flop on 18.04.2024.
//

import Foundation


class LoadingPresenter: PresenterBase<LoadingView, LoadingInteractorProtocol, LoadingRouter> {
    override func bind() {
        let c = self.view?.bc ?? .black
        print("LoadingPresenter bind \(c)")
        
        interactor.lolEventTrigger?.subscribe(onNext: { [weak self] in
            self?.kek()
        }).disposed(by: self.disposeBag)
        
        self.interactor.lol()
    }
    
    func kek() {
        print("LoadingPresenter kek")
        self.router.kek()
    }
}

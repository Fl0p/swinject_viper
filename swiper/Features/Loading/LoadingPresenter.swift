//
//  LoadingPresenter.swift
//  swiper
//
//  Created by Flop on 18.04.2024.
//

import Foundation

protocol LoadingPresenterProtocol {
    func kek()
}

class LoadingPresenter: PresenterBase<LoadingViewProtocol, LoadingInteractorProtocol, LoadingRouterProtocol>, LoadingPresenterProtocol {
    override func bind() {
        let c = self.view?.bc ?? .black
        print("LoadingPresenter bind \(c)")
        self.interactor.lol()
    }
    
    func kek() {
        print("LoadingPresenter kek")
        self.router.kek()
    }
}

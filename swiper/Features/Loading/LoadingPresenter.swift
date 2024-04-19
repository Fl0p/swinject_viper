//
//  LoadingPresenter.swift
//  swiper
//
//  Created by Flop on 18.04.2024.
//

import Foundation

protocol LoadingPresenterProtocol {
    
}

class LoadingPresenter: PresenterBase<LoadingViewProtocol, LoadingInteractorProtocol, LoadingRouterProtocol>, LoadingPresenterProtocol {
    override func bind() {
        let c = self.view?.bc ?? .black
        print("LoadingPresenter bind \(c)")
    }
}

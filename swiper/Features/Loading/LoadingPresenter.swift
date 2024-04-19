//
//  LoadingPresenter.swift
//  swiper
//
//  Created by Flop on 18.04.2024.
//

import Foundation

final class LoadingPresenter: Presenter<LoadingView, LoadingRouter, LoadingInteractor> {
    override func bind() {
        print("LoadingPresenter bind \(self.view?.bc ?? .black)")
    }
}

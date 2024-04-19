//
//  LoadingInteractor.swift
//  swiper
//
//  Created by Flop on 18.04.2024.
//

import Foundation

protocol LoadingInteractorProtocol: InteractorProtocol {
    func lol()
}

final class LoadingInteractor: InteractorBase<LoadingPresenterProtocol>, LoadingInteractorProtocol {

    func lol() {
        guard let p = self.presenter else { return }
        print("Pres \(p)")
    }
}

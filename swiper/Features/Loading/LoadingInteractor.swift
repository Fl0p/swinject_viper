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

final class LoadingInteractor: InteractorBase, LoadingInteractorProtocol {

    func lol() {
        print("LoadingInteractor lol")
//        guard let p = self.presenter else { return }
//        print("Presenter \(p)")
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.presenter?.kek()
//        }
    }
}

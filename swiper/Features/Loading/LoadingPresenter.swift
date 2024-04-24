//
//  LoadingPresenter.swift
//  swiper
//
//  Created by Flop on 18.04.2024.
//

import Foundation
import RxSwift
import RxCocoa

class LoadingPresenter: VIPERPresenter<LoadingView, LoadingInteractor, LoadingRouter> {
    override func bind() {
        print("LoadingPresenter bind")
        interactor.loadedTrigger.subscribe(onNext: { [weak self] in
            print("LoadingInteractor loaded")
            self?.router.loaded(4)
        }).disposed(by: self.disposeBag)
    }
    
    func kek() {
        print("LoadingPresenter kek")
    }
}

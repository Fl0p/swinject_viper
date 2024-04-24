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
            guard let self = self else { return }
            let num = self.interactor.num
            self.router.loaded(num)
        }).disposed(by: self.disposeBag)
        
        guard let view = self.view else { return }
        interactor.string.asObservable()
            .bind(to: view.lbl.rx.text)
            .disposed(by: self.disposeBag)
        
        interactor.loading.asObservable()
            .bind(to: view.act.rx.isAnimating)
            .disposed(by: self.disposeBag)
    }
    
    func kek() {
        print("LoadingPresenter kek")
    }
}

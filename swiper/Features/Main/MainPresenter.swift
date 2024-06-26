//
//  MainPresenter.swift
//  swiper
//
//  Created by Flop on 24.04.2024.
//

import Foundation
import RxSwift
import RxCocoa

class MainPresenter: VIPERPresenter<MainView, MainInteractor, MainRouter> {
    override func bind() {
        print("MainPresenter bind \(self)")
        
        interactor.lolEventTrigger.subscribe(onNext: { [weak self] in
            print("MainPresenter lol")
            self?.router.lol("lol")
        }).disposed(by: self.disposeBag)

        interactor.kekEventTrigger.subscribe(onNext: { [weak self] in
            print("MainPresenter kek")
            self?.router.kek()
        }).disposed(by: self.disposeBag)

        guard let view = self.view else { return }
        view.lolBtn.rx.tap
        .subscribe(onNext: { [weak self] in
            self?.interactor.lol()
        }).disposed(by: self.disposeBag)
        
        view.kekBtn.rx.tap
        .subscribe(onNext: { [weak self] in
            self?.interactor.kek()
        }).disposed(by: self.disposeBag)
        
    }
    
    func kek() {
        print("MainPresenter kek")
        self.router.kek()
    }
}

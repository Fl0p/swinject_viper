//
//  LoadingRouter.swift
//  swiper
//
//  Created by Flop on 18.04.2024.
//

import Foundation
import UIKit

protocol LoadingRouterProtocol: RouterProtocol {
    func kek()
}

final class LoadingRouter: RouterBase, LoadingRouterProtocol {
    
    override func onStart() {
        super.onStart()
        guard let own else { return }
        self.root.setViewControllers([own], animated: true)
    }
    
    func kek() {
        
    }
    
}

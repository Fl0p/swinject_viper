//
//  LoadingRouter.swift
//  swiper
//
//  Created by Flop on 18.04.2024.
//

import Foundation
import UIKit

final class LoadingRouter: Router {
    
    override func start() {
        super.start()
        guard let own else { return }
        self.root.setViewControllers([own], animated: true)
    }
    
}

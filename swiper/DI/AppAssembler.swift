//
//  AppAssembler.swift
//  swiper
//
//  Created by Flop on 16.04.2024.
//

import Foundation
import Swinject

final class AppAssembler  {
    
    let container = Container()
    let assembler: Assembler
    
    var resolver: Resolver {
        return container.synchronize()
    }
    
    init() {
        self.assembler = Assembler(
            [
                OneAssembly()
            ],
            container: container
        )
    }
    
}

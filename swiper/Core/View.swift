//
//  View.swift
//  swiper
//
//  Created by Flop on 19.04.2024.
//

import Foundation
import UIKit

protocol ViewProtocol: AnyObject {
    
}

public class ViewBase: UIView, ViewProtocol {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    open func commonInit() {
        
    }
}


protocol ViewControllerProtocol: AnyObject {
    associatedtype Presenter: PresenterProtocol
    associatedtype View
    var presenter: Presenter { get }
    var myView: Presenter.View { get }
    var controller: UIViewController { get }
}

class ViewController<V: ViewBase, P: PresenterProtocol>: UIViewController, ViewControllerProtocol {

    typealias View = V
    typealias Presenter = P
    
    var myView: P.View {
        self.view as! P.View
    }
    
    var presenter: Presenter

    var controller: UIViewController {
        return self
    }
    
    init(presenter: Presenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = V()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewReady(view: self.myView)
    }
    
}

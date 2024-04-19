//
//  View.swift
//  swiper
//
//  Created by Flop on 19.04.2024.
//

import Foundation
import UIKit

protocol ViewControllerProtocol: AnyObject {
    associatedtype P
    associatedtype V
    var presenter: P { get }
    var myView: V { get }
    var controller: UIViewController { get }
}

protocol ViewProtocol: AnyObject {
    
}

public class View: UIView, ViewProtocol {
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

class ViewController<V: View, P: PresenterProtocol>: UIViewController, ViewControllerProtocol {

    var presenter: P

    var myView: P.V {
        return view as! P.V
    }

    var controller: UIViewController {
        return self
    }
    
    init(presenter: P) {
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

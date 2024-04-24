//
//  View.swift
//  swiper
//
//  Created by Flop on 19.04.2024.
//

import Foundation
import UIKit

protocol ViewProtocol: UIView {
    func applyStyle()
    func applyLayout()
}

public class VIPERView: UIView, ViewProtocol {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    open func commonInit() {
        self.applyStyle()
        self.applyLayout()
    }
    open func applyStyle() {
        
    }
    open func applyLayout() {
        
    }
}


protocol ViewControllerProtocol: UIViewController {
    associatedtype Presenter: PresenterProtocol
    associatedtype View: ViewProtocol
    var presenter: Presenter { get }
    var myView: View { get }
    var controller: UIViewController { get }
    func start()
}

class ViewController<V: ViewProtocol, P: PresenterProtocol>: UIViewController, ViewControllerProtocol
where V == P.View, V: ViewProtocol
{

    typealias View = V
    typealias Presenter = P
    
    var myView: View {
        self.view as! View
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
 
    func start() {
        self.presenter.router.onStart(ownVC: self)
    }
}

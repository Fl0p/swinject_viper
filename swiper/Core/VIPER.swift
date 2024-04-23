//
//  VIPERView.swift
//  swiper
//
//  Created by Flop on 18.04.2024.
//

import Foundation
import UIKit

protocol myViewProto: UIView { }

class myViewClass: UIView, myViewProto {
    func lol() {}
}


protocol myControllerProtocol: UIViewController {
    associatedtype View: myViewProto
    associatedtype Presenter: myPresenterProto
    var myView: View { get }
    var presenter: Presenter? { get set }
}

class myController<V: myViewProto, P: myPresenterProto>: UIViewController, myControllerProtocol
where V == P.View, V: myViewProto
{
    
    typealias View = V
    typealias Presenter = P
    var presenter: Presenter?
    
    var myView: V {
        self.view as! V
    }
    
    func lol() {
        self.presenter?.ready(item: self.myView)
    }
}


//---

protocol myPresenterProto: AnyObject {
    associatedtype View: myViewProto
    func ready(item : View?)
}

protocol myPresenter2Proto: myPresenterProto {

    
}

class myPresenterBase<V>: myPresenter2Proto where V: myViewProto
{
    weak var v: V?
    func ready(item: V?) {
        v = item
    }
}

//--

protocol cViewProto: myViewProto {
    func test()
}

class cViewClass: myViewClass {
    func test() {
        print("test")
    }
}

class cPresenter: myPresenterBase<cViewClass> {
    func bar() {
        v?.test()
    }
}

class cController: myController<cViewClass, cPresenter> {
    func foo() {
        let v = self.myView
        let p = self.presenter
        p?.ready(item: self.myView)
        v.test()
        p?.bar()
    }
}

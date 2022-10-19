//
//  NewsPageProtocol.swift
//  NewsWatchApp WatchKit Extension
//
//  Created by engin gülek on 18.10.2022.
//

import Foundation

protocol ViewToPresenterNewsPageProtocol {
    var interactor : PresenterToInteractorNewsPageProtocol? {set get}
    var newsPage : PresenterToViewNewsPageProtocol? {get set}
    func getNewsAction(source:String)
    
}

protocol PresenterToInteractorNewsPageProtocol {
    var presenter: InteractorToPresenterNewsPageProtocol? {get set}
    func getNews(source:String)
    
}

protocol InteractorToPresenterNewsPageProtocol {
    func toPresenter(articles:Array<Articles>)
}

protocol PresenterToViewNewsPageProtocol {
    func toView(artricles:Array<Articles>)
    
}

protocol NewsPageRouterProtocol {
    static func createView(view:NewsPageController)
}

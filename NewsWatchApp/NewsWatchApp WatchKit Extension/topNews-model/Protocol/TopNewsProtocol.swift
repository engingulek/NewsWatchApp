//
//  TopNewsProtocol.swift
//  NewsWatchApp WatchKit Extension
//
//  Created by engin gülek on 17.10.2022.
//

import Foundation


protocol ViewToPresenterTopNewsProtocol {
    var interactor : PresenterToInteractorTopNewsProtocol? {get set}
    var topNewsPage : PresenterToViewTopNewsProtocol? {get set}
    func getTopNewsAction()
    
}

protocol PresenterToInteractorTopNewsProtocol {
    var toNewsPagePresenter : InteractorToPresenterTopNewsProtocol? {get set}
    func getTopNews()
    
}


protocol InteractorToPresenterTopNewsProtocol {
    func toPresenter(articles:Array<Articles>)
}

protocol PresenterToViewTopNewsProtocol {
    func toView(articles:Array<Articles>)
}


protocol TopNewsRouterProtcol {
    static func createView(view:TopNewsController)
}

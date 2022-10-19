//
//  TopNewsPagePresenter.swift
//  NewsWatchApp WatchKit Extension
//
//  Created by engin gülek on 15.10.2022.
//

import Foundation


class TopNewsPagePresenter : ViewToPresenterTopNewsProtocol {
    var interactor: PresenterToInteractorTopNewsProtocol?
    var topNewsPage : PresenterToViewTopNewsProtocol?
    
    func getTopNewsAction() {
        interactor?.getTopNews()
    }
}


extension TopNewsPagePresenter : InteractorToPresenterTopNewsProtocol {
    func toPresenter(articles: Array<Articles>) {
        topNewsPage?.toView(articles: articles)
    }

}


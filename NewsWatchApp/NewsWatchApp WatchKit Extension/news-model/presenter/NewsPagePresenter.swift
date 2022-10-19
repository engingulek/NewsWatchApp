//
//  NewsPagePresenter.swift
//  NewsWatchApp WatchKit Extension
//
//  Created by engin gülek on 18.10.2022.
//

import Foundation
class NewsPagePresenter : ViewToPresenterNewsPageProtocol  {
    var interactor: PresenterToInteractorNewsPageProtocol?
    var newsPage: PresenterToViewNewsPageProtocol?
    func getNewsAction(source:String) {
        interactor?.getNews(source: source)
    }
}


extension NewsPagePresenter : InteractorToPresenterNewsPageProtocol {
    func toPresenter(articles: Array<Articles>) {
        newsPage?.toView(artricles: articles)
    }
}

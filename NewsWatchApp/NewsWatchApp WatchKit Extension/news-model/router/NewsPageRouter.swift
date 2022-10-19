//
//  NewsPageRouter.swift
//  NewsWatchApp WatchKit Extension
//
//  Created by engin gülek on 18.10.2022.
//

import Foundation

class NewsPageRouter : NewsPageRouterProtocol {
    static func createView(view: NewsPageController) {
        let presenter = NewsPagePresenter()
        view.newsPageObject = presenter
        view.newsPageObject?.interactor = NewsPageInteractor()
        view.newsPageObject?.interactor?.presenter = presenter 
        view.newsPageObject?.newsPage = view

    }
    
    
}

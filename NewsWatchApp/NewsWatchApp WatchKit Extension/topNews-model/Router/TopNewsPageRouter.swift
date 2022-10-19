//
//  TopNewsPageRouter.swift
//  NewsWatchApp WatchKit Extension
//
//  Created by engin gülek on 15.10.2022.
//

import Foundation

class TopNewsPageRouter : TopNewsRouterProtcol {
    static func createView(view: TopNewsController) {
        let presenter = TopNewsPagePresenter()
        view.topNewsObject = presenter
        view.topNewsObject?.interactor = TopNewsInteractor()
        view.topNewsObject?.interactor?.toNewsPagePresenter = presenter
        view.topNewsObject?.topNewsPage = view
    }
    
    
}

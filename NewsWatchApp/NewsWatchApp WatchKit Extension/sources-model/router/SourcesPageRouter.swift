//
//  SourcesPageRouter.swift
//  NewsWatchApp WatchKit Extension
//
//  Created by engin gülek on 17.10.2022.
//

import Foundation

class SourcesPageRouter : SourcePageRouterProtocol {
    static func createView(view: SourcesController) {
        let presenter = SourcesPagePresenter()
        view.sourceObject = presenter
        view.sourceObject?.interactor = SourcePageInteractor()
        view.sourceObject?.interactor?.toSpurcePagePresenter = presenter
        view.sourceObject?.sourcePage = view
        
    }
    
    
}

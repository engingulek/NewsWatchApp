//
//  SearchPagePresenter.swift
//  NewsWatchApp WatchKit Extension
//
//  Created by engin gülek on 17.10.2022.
//

import Foundation

class SourcesPagePresenter : ViewToPresenterSourcesPageProtocol {
    var interactor: PresenterToInteractorSourcesPageProtocol?
    
    var sourcePage: PresenterToViewSourcesPageProtocol?
    
    func getSourceAction() {
        interactor?.getSources()
    }
    
    
}

extension SourcesPagePresenter: InteractorToPresenterSourcesPageProtocol {
    func toPresenter(sources: Array<SourceData>) {
        sourcePage?.toView(sources: sources)
    }
    
    
}

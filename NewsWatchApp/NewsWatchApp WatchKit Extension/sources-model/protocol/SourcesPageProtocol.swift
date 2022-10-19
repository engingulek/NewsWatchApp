//
//  SourcesPageRouter.swift
//  NewsWatchApp WatchKit Extension
//
//  Created by engin gülek on 17.10.2022.
//

import Foundation

protocol ViewToPresenterSourcesPageProtocol {
    var interactor : PresenterToInteractorSourcesPageProtocol? {get set}
    var sourcePage : PresenterToViewSourcesPageProtocol? {get set}
    func getSourceAction()
    
}

protocol PresenterToInteractorSourcesPageProtocol {
    var toSpurcePagePresenter : InteractorToPresenterSourcesPageProtocol? {get set}
    func getSources()
    
}

protocol InteractorToPresenterSourcesPageProtocol {
    func toPresenter(sources:Array<SourceData>)
    
}

protocol PresenterToViewSourcesPageProtocol {
    func toView(sources:Array<SourceData>)
    
}


protocol SourcePageRouterProtocol {
    static func createView(view:SourcesController)
    
}

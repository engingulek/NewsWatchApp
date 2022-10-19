//
//  SourcePageInteractor.swift
//  NewsWatchApp WatchKit Extension
//
//  Created by engin gülek on 17.10.2022.
//

import Foundation

class SourcePageInteractor : PresenterToInteractorSourcesPageProtocol {
    var toSpurcePagePresenter: InteractorToPresenterSourcesPageProtocol?
    
    func getSources() {
        let url = "\(Constant.baseUrl)\(QueryParams.source)&apiKey=\(Constant.id)"
        APICaller.shared.fetchDataSource(url: url) { result in
            switch result {
            case .success(let sources):
                self.toSpurcePagePresenter?.toPresenter(sources: sources!)
            case .failure(let error):
                print(error.localizedDescription)
                let nullSources = [SourceData]()
                self.toSpurcePagePresenter?.toPresenter(sources: nullSources)
                print(nullSources)
            }
        }
        
    }
    
    
}

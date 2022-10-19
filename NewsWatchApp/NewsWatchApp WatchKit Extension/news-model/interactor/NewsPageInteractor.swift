//
//  NewsPageInteractor.swift
//  NewsWatchApp WatchKit Extension
//
//  Created by engin gülek on 18.10.2022.
//

import Foundation

class NewsPageInteractor : PresenterToInteractorNewsPageProtocol {
    var presenter: InteractorToPresenterNewsPageProtocol?
    
    func getNews(source:String) {
        let url = "\(Constant.baseUrl)\(QueryParams.sourceNews)\(source)&apiKey=\(Constant.id)"
        print("intractor call")
        APICaller.shared.fetchDataArticles(url: url) { result in
            switch result {
            case .success(let articles):
                
                self.presenter?.toPresenter(articles: articles!)
                
            case .failure(let error):
                let nullArticles = [Articles]()
                self.presenter?.toPresenter(articles: nullArticles)
                print(error.localizedDescription)
                
            }
        }
    }
    
   
    
}

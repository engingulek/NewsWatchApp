//
//  TopNewsPageInteractor.swift
//  NewsWatchApp WatchKit Extension
//
//  Created by engin gülek on 15.10.2022.
//

import Foundation

class TopNewsInteractor : PresenterToInteractorTopNewsProtocol {
    var toNewsPagePresenter: InteractorToPresenterTopNewsProtocol?
    
    func getTopNews() {
        let url = "\(Constant.baseUrl)\(QueryParams.topNews)&apiKey=\(Constant.id)"
        APICaller.shared.fetchDataArticles(url: url) { result in
            switch result{
            case .success(let articles):
                self.toNewsPagePresenter?.toPresenter(articles: articles!)
            case .failure(let error):
                print(error.localizedDescription)
                let nullTopNews = [Articles]()
                self.toNewsPagePresenter?.toPresenter(articles: nullTopNews)
            }
        }
     }
        
    }
    
    
     
    
   


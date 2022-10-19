//
//  APICaller.swift
//  NewsWatchApp WatchKit Extension
//
//  Created by engin gülek on 15.10.2022.
//

import Foundation

struct QueryParams {
   // static let newsDomain = "";
    static let topNews = "top-headlines?country=us"
    static let sourceNews = "top-headlines?sources="
   static let source = "top-headlines/sources?country=us"
}

struct Constant {
    static let baseUrl = "https://newsapi.org/v2/"
    static let id = "apikey"
}


class APICaller {
   static let shared = APICaller()
    
    func fetchDataArticles(url:String,completion:@escaping(Result<[Articles]?,Error>)-> Void) {
        if let url = URL(string: url) {
            let request = URLRequest(url: url)
            let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
                do{
                    if let data = data {
                        let result = try JSONDecoder().decode(NewsResult.self, from: data)
                        if result.status == "ok"{
                            completion(.success(result.articles))
                        }
                    }
                }catch{
                    completion(.failure(error))
                }
            }
            dataTask.resume()
        }
    }
    
    func fetchDataSource(url:String,completion:@escaping(Result<[SourceData]?,Error>) -> ()) {
        if let url = URL(string: url) {
            let request = URLRequest(url: url)
            let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
                do{
                    if let data = data {
                        let result = try JSONDecoder().decode(SourceResult.self, from: data)
                        if result.status == "ok"{
                            completion(.success(result.sources))
                        }
                    }
                }catch{
                    completion(.failure(error))
                    
                }
            }
            dataTask.resume()
        }
    }

    
}

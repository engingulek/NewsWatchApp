//
//  NewsData.swift
//  NewsWatchApp WatchKit Extension
//
//  Created by engin gülek on 15.10.2022.
//

import Foundation

class Articles : Codable {
    let source : SourceData?
    let author: String?
    let title: String?
    let description:String?
    let urlToImage:String?
    let publishedAt:String?
    let content:String?
    
}

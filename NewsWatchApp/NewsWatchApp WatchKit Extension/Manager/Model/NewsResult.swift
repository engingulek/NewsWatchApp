//
//  NewsResult.swift
//  NewsWatchApp WatchKit Extension
//
//  Created by engin gülek on 15.10.2022.
//

import Foundation

struct NewsResult : Codable {
    let status : String?
    let articles : [Articles]?
}

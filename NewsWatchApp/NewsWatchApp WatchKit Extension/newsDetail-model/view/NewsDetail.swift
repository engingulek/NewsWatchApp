//
//  NewsDetail.swift
//  NewsWatchApp WatchKit Extension
//
//  Created by engin gülek on 18.10.2022.
//

import Foundation
import WatchKit

class NewsDetail : WKInterfaceController {
    @IBOutlet weak var newsDetailImage: WKInterfaceImage!
    @IBOutlet weak var newsDetailContentLabel: WKInterfaceLabel!
    
    @IBOutlet weak var newsDeatilAuthorLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        if let news = context as? Articles {
            let url = URL(string: news.urlToImage!)
            let nilUrl = URL(string: "https://image.shutterstock.com/image-vector/news-anchor-on-tv-breaking-600w-442698565.jpg")
            let data = try? Data(contentsOf: url ?? nilUrl!)
            newsDetailImage.setImageData(data)
            newsDeatilAuthorLabel.setText(news.author ?? "None")
            newsDetailContentLabel.setText(news.description ?? news.content)
            
            
           
            
        }
        
        
        
    }
}

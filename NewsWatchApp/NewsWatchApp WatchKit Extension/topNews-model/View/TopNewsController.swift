//
//  InterfaceController.swift
//  NewsWatchApp WatchKit Extension
//
//  Created by engin gülek on 15.10.2022.
//

import WatchKit
import Foundation




class TopNewsController: WKInterfaceController,PresenterToViewTopNewsProtocol {

    

    @IBOutlet weak var topNewsTable: WKInterfaceTable!
    var topNewsObject : ViewToPresenterTopNewsProtocol?
    
    var topNews = [Articles]()
    override func awake(withContext context: Any?) {
        TopNewsPageRouter.createView(view: self)
        topNewsObject?.getTopNewsAction()
    
    }
    func toView(articles: Array<Articles>) {
        self.topNews = articles
        DispatchQueue.main.async  {
            self.topNewsTable.setNumberOfRows(self.topNews.count, withRowType: "topNewsRow")
            for rowIndex in 0...self.topNews.count-1{
                let news = self.topNews[rowIndex]
                let row = self.topNewsTable.rowController(at: rowIndex) as! TopNewsRowCont
                
                row.newsTitle.setText(news.title)
                
                let url = URL(string: news.urlToImage!)
                let nilUrl = URL(string: "https://image.shutterstock.com/image-vector/news-anchor-on-tv-breaking-600w-442698565.jpg")
                let data = try? Data(contentsOf: url ?? nilUrl!)
                  row.newsImage.setImageData(data)
           
            }
        }
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        let news = self.topNews[rowIndex]
        pushController(withName: "newsDetail", context: news)
    }
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

}


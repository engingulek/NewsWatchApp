//
//  File.swift
//  NewsWatchApp WatchKit Extension
//
//  Created by engin gülek on 17.10.2022.
//


import WatchKit
import Darwin
class NewsPageController : WKInterfaceController, PresenterToViewNewsPageProtocol {

    @IBOutlet private weak var newsTable: WKInterfaceTable!
    @IBOutlet weak var sourceTitleLabel: WKInterfaceLabel!
    var sourceName:String = ""
    var newsPageObject : ViewToPresenterNewsPageProtocol?
    var newsList = [Articles]()
    override func awake(withContext context: Any?) {
        NewsPageRouter.createView(view: self)
       
        if let source = context as?  SourceData {
            sourceTitleLabel.setText(source.name)
            self.sourceName = source.name!
            newsPageObject?.getNewsAction(source: source.id!)
            
        }
        
    }
    
    
    func toView(artricles: Array<Articles>) {
        DispatchQueue.main.async {
            self.newsList = artricles
            self.newsTable.setNumberOfRows(self.newsList.count, withRowType: "newsRow")
            for rowIndex in 0...self.newsList.count-1 {
                let news = self.newsList[rowIndex]
                let row = self.newsTable.rowController(at: rowIndex) as! NewsRowController
                row.newsLabel.setText(news.title)
                
                let url = URL(string: news.urlToImage!)
                let nilUrl = URL(string: "https://image.shutterstock.com/image-vector/news-anchor-on-tv-breaking-600w-442698565.jpg")
                let data = try? Data(contentsOf: url ?? nilUrl!)
                  row.newsImage.setImageData(data)
            }
        }
       
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        let news = self.newsList[rowIndex]
        pushController(withName: "newsDetail", context: news)
    }
    

}

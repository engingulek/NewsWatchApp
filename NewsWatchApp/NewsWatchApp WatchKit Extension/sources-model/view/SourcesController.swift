//
//  SourcesController.swift
//  NewsWatchApp WatchKit Extension
//
//  Created by engin gülek on 17.10.2022.
//

import Foundation
import WatchKit

class SourcesController : WKInterfaceController , PresenterToViewSourcesPageProtocol {
    var sources = [SourceData]()
    
    @IBOutlet weak var sourceTable: WKInterfaceTable!
    var sourceObject : ViewToPresenterSourcesPageProtocol?
    override func awake(withContext context: Any?) {
        SourcesPageRouter.createView(view: self)
        sourceObject?.getSourceAction()
    }
    
    
    func toView(sources: Array<SourceData>) {
        self.sources = sources
        DispatchQueue.main.async {
            self.sourceTable.setNumberOfRows(self.sources.count, withRowType: "sourceRow")
            for rowIndex in 0...self.sources.count-1 {
                let source = self.sources[rowIndex]
                let row = self.sourceTable.rowController(at: rowIndex)
                as! SourceRowController
                row.sourcesLabel.setText(source.name)
                
            }
        }
        
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        print(self.sources[rowIndex].name!)
        pushController(withName: "newsPage", context: self.sources[rowIndex])
    }
    
}

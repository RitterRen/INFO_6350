//
//  StockTableViewCell.swift
//  StockPrice
//
//  Created by 任耀坤 on 4/10/22.
//

import UIKit

class StockTableViewCell: UITableViewCell {

    @IBOutlet weak var symbol: UILabel!
    @IBOutlet weak var companyName: UILabel!
    
    var currSymbol = ""
    var currCompanyName = ""
    var sendDataDelegate: SendDataDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func getPriceAction(_ sender: Any) {
        print("========================button click============================")
        let currStockPriceModel = StockPriceModel();
        
        currStockPriceModel.companyName = companyName.text!
        currStockPriceModel.symbol = symbol.text!
//
//        let currentURL = "\(stockURL)\(symbol.text!)?apiKey=\(myKey)"
//        print("in the main function")
//        getStockData(currentURL)
//            .done { initStockPriceModel in
//                print("company = ", initStockPriceModel.companyName)
//                print("symbol = ", initStockPriceModel.symbol)
//                print("price = ", initStockPriceModel.price)
//                print("dayHigh = ", initStockPriceModel.dayHigh)
//                print("dayLow = ", initStockPriceModel.dayLow)
//                
//                self.showOnTop(stockPriceModel: initStockPriceModel)
//            }
//            .catch { error in
//                print(error.localizedDescription)
//            }
        
        self.sendDataDelegate?.sendStockPriceModel(stockPriceModel: currStockPriceModel)
    }
}

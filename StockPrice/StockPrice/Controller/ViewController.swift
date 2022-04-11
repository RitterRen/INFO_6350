//
//  ViewController.swift
//  StockPrice
//
//  Created by 任耀坤 on 4/10/22.
//

import UIKit
import PromiseKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SendDataDelegate{

    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var lblDayLow: UILabel!
    @IBOutlet weak var lblDayHigh: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblSymbol: UILabel!
    @IBOutlet weak var tblView: UITableView!
    //var initStockPriceModel: StockPriceModel = StockPriceModel()
    
    let staticCompanyList = ["Facebook", "Apple", "Google", "Microsoft", "Amazon"]
    let staticCompanySymbol = ["FB", "AAPL", "GOOG", "MSFT", "AMZN"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let initialURL = initialURL;
        getStockData(initialURL)
            .done { initStockPriceModel in
                print("company = ", initStockPriceModel.companyName)
                print("symbol = ", initStockPriceModel.symbol)
                print("price = ", initStockPriceModel.price)
                print("dayHigh = ", initStockPriceModel.dayHigh)
                print("dayLow = ", initStockPriceModel.dayLow)
                
                self.showOnTop(stockPriceModel: initStockPriceModel)
            }
            .catch { error in
                print(error.localizedDescription)
            }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return staticCompanyList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("StockTableViewCell", owner: self)?.first as! StockTableViewCell
        
        cell.symbol?.text = staticCompanySymbol[indexPath.row]
        cell.companyName?.text = staticCompanyList[indexPath.row]
        cell.sendDataDelegate = self
        
        return cell
    }
    
//    func getUrl(stockURL: String, symbol: String, key: String) -> String {
//        let url = "\(stockURL)\(symbol)?apiKey=\(key)"
//
//        return url
//    }
//    
    func showOnTop(stockPriceModel: StockPriceModel) {
        lblCompanyName.text = stockPriceModel.companyName
        lblSymbol.text = stockPriceModel.symbol
        lblPrice.text = stockPriceModel.price
        lblDayHigh.text = stockPriceModel.dayHigh
        lblDayLow.text = stockPriceModel.dayLow
        
    }
    
    func sendStockPriceModel(stockPriceModel: StockPriceModel) {
        let currentURL = "\(stockURL)\(stockPriceModel.symbol)?apikey=\(myKey)"
        print(currentURL)
        getStockData(currentURL)
            .done { initStockPriceModel in
                print("company = ", initStockPriceModel.companyName)
                print("symbol = ", initStockPriceModel.symbol)
                print("price = ", initStockPriceModel.price)
                print("dayHigh = ", initStockPriceModel.dayHigh)
                print("dayLow = ", initStockPriceModel.dayLow)
                
                self.showOnTop(stockPriceModel: initStockPriceModel)
            }
            .catch { error in
                print(error.localizedDescription)
            }
    }
    
    func getStockData(_ url: String) -> Promise<StockPriceModel> {
        return Promise<StockPriceModel> { seal -> Void in
//            print(url)
            AF.request(url).responseJSON { response in
                if response.error != nil {
                    seal.reject(response.error!)
                }
                
                let stockPriceModel = StockPriceModel()
                
                guard let stockPriceJSON = JSON(response.data!).arrayValue.first else {return seal.fulfill(stockPriceModel)}
                print(stockPriceJSON)
                stockPriceModel.companyName = stockPriceJSON["name"].stringValue
                stockPriceModel.symbol = stockPriceJSON["symbol"].stringValue
                stockPriceModel.price = stockPriceJSON["price"].stringValue
                stockPriceModel.dayHigh = stockPriceJSON["dayHigh"].stringValue
                stockPriceModel.dayLow = stockPriceJSON["dayLow"].stringValue
                
                seal.fulfill(stockPriceModel)
                //self.initStockPriceModel = stockPriceModel
                
            }
        }
    }
    
}


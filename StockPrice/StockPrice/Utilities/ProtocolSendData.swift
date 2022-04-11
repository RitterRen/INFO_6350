//
//  ProtocolSendData.swift
//  StockPrice
//
//  Created by 任耀坤 on 4/10/22.
//

import Foundation

protocol SendDataDelegate {
    func sendStockPriceModel(stockPriceModel: StockPriceModel)
}

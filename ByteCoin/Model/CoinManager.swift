//
//  CoinManager.swift
//  ByteCoin
//
//  Created by YILDIRIM on 2.09.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
struct CoinManager {
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "YOUR_API_KEY_HERE"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getPrice(for currency: String){
        
    }
}

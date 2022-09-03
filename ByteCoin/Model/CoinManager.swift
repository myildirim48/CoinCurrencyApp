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
    let apiKey = "9A103275-2CCE-4AB9-BE7D-A9A72A3187F4"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getPrice(for currency: String){
        
        let urlString = "\(baseURL)/\(currency)/?apikey=\(apiKey)"
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    let bitcoinPrice = self.parseJSON(safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> Double? {
        
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let lastPrice = decodedData.rate
            
            print(lastPrice)
            
            return lastPrice
        }catch {
            print(error)
            return nil
        }
        
    }
}

//
//  DataLoader.swift
//  Weatheer
//
//  Created by G4B0 CU4DR05_C4RD3N4S on 7/05/18.
//  Copyright © 2018 G4B0 CU4DR05_C4RD3N4S. All rights reserved.
//

import Foundation

class dataLoader {
    
    private let baseUrl = "http://api.openweathermap.org/data/2.5/weather"
    private let apiKey = "72cffb80a25b647028b7a5b8d1a5e49b"
    private let queueRestServices = ["?q=","APPID="]
    
    //http://api.openweathermap.org/data/2.5/weather?q=Kyoto&APPID=72cffb80a25b647028b7a5b8d1a5e49b
    
    func loadWeatherData (city : String) {
        
        let session = URLSession.shared
        let requestURL : URL = URL(string:"\(baseUrl)\(queueRestServices[0])\(city)&\(queueRestServices[1])\(apiKey)")!
        
        let dataTask = session.dataTask(with: requestURL) { (data : Data?, response : URLResponse?, error : Error?) in
            
            if let error = error {
                print("We Got some error in DataLoader.swift - \(error.localizedDescription)")
            } else {
                // Todo esta bien :3
                
                let dataSuccess = String(data: data!, encoding: String.Encoding.utf8)
                //print("Success!")
                print(dataSuccess!)
                
            }
            
         }
        
        dataTask.resume()
        
    }

    
}


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
                
                //let dataSuccess = String(data: data!, encoding: String.Encoding.utf8)
                //print(dataSuccess!)
                
                guard let data = data else { return }
                
                do {
                    
                    let weatherJSON = try JSONDecoder().decode(openWeatherResponse.self, from: data)
                    print(weatherJSON.name)
                    print(kelvinToCelcius(kelvin: weatherJSON.main.temp))
                } catch {
                    print(error.localizedDescription)
                    print("Error decoding JSON from Open Weather with the model -openWeatherResponse-")
                }
                
            }
            
         }
        
        dataTask.resume()
        
    }

    
}

struct openWeatherResponse : Decodable {
    
    let coord: coordOW
    let weather: [weatherOW]
    let base: String
    let main: mainOW
    let visibility: Int
    let wind: windOW
    let clouds: cloudsOW
    let dt: Int
    let sys : sysOW
    let id: Int
    let name: String
    let cod: Int
}

struct coordOW : Decodable {
    let lon: Double
    let lat: Double
}

struct weatherOW : Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct mainOW : Decodable {
    let temp: Double
    let pressure: Int
    let humidity: Int
    let temp_min: Double
    let temp_max: Double
}

struct windOW : Decodable {
    let speed: Double
    let deg: Int
}

struct cloudsOW : Decodable {
    let all: Int
}

struct sysOW : Decodable {
    let type: Int
    let id: Int
    let message: Double
    let country: String
    let sunrise: Int
    let sunset: Int
    
}



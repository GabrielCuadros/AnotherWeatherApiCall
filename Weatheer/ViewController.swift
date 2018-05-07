//
//  ViewController.swift
//  Weatheer
//
//  Created by G4B0 CU4DR05_C4RD3N4S on 6/05/18.
//  Copyright © 2018 G4B0 CU4DR05_C4RD3N4S. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let weatherData = dataLoader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("ViewDidLoad")
        weatherData.loadWeatherData(city: "Kyoto")
        loadCityJSON()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadCityJSON () {
        
        let ruta = Bundle.main.path(forResource: "city", ofType: "json")
        let url = URL(fileURLWithPath: ruta!)
        
        do {
            let data = try Data(contentsOf: url)
            let cities = try JSONDecoder().decode([City].self, from: data)
            //print(cities) - Funciona pero toca optimizar esta funcion
            for city in cities {
                print("\n\(city.name)")
            }
        }
        catch {}
    }

}


struct City : Decodable {
    
    let id: Int
    let name: String
    let country: String
    //let lon: Double
    //let lat: Double
    
    
    init(json : [String:Any]) {
        
        id = json["id"] as? Int ?? -1
        name = json["name"] as? String ?? ""
        country = json["country"] as? String ?? ""
        //lon = json["coord"]!["lon"] as? Double ?? -0.1
        //lat = json["coord"]!["lat"] as? Double ?? -0.1
        
    }
    
}




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
    var globalCities : [City]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        weatherData.loadWeatherData(city: "Kyoto")
        //loadCityJSON()
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
            globalCities = cities
            /*
            for city in cities {
                print("\n\(city.name)")
                print(city.coord)
            }
            */
            
            guard let unwrappedCities = globalCities else { return }
            print(unwrappedCities.count)
            
            for city in unwrappedCities {
                print("\n\(city.name), \(city.country)")
                
            }
            
        }
        catch {
            print("The JSON Decoder dont works")
            return
        }
    }

}


struct City : Decodable {
    
    let id: Int
    let name: String
    let country: String
    let coord: Coord
}

struct Coord : Decodable {
    let lon: Double
    let lat: Double
    
}




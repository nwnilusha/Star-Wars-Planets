//
//  PlanetListViewController.swift
//  StarWars
//
//  Created by Nilusha Wimalasena on 2022-09-17.
//

import Foundation
import Alamofire
import SwiftyJSON

class PlanetListViewController:ObservableObject{
    
    @Published var planets = [planet]()

    var planetURL:String = "https://swapi.dev/api/planets/?page=1"

    // Retrieve star wars api data
    func getAllPlannetList(){
        AF.request(self.planetURL).response { response in
            let json = try! JSON(data: response.data!)
            self.planetURL = json["next"].stringValue
            
            for i in json["results"]{
                self.planets.append(planet(id: i.1["diameter"].intValue, name: i.1["name"].stringValue, climate: i.1["climate"].stringValue, orbital_period: i.1["orbital_period"].stringValue, gravity: i.1["gravity"].stringValue))
            }
        }
        
    }
}


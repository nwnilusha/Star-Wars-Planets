//
//  PlanetListView.swift
//  StarWars
//
//  Created by Nilusha Wimalasena on 2022-09-17.
//

import SwiftUI
import SDWebImageSwiftUI

struct PlanetListView: View {
    
    @ObservedObject var allPlanets = PlanetListViewController()
    var body: some View {
        NavigationView{
            
            List {
                ForEach(allPlanets.planets){planet in
                    NavigationLink(destination: PlanetView(planets: planet), label: {
                        planetList(name: planet.name, climate: planet.climate, id:planet.id)
                    })
                }
                
                if allPlanets.planetURL != ""{
                    Text("Featching data")
                        .onAppear(perform:{
                            allPlanets.getAllPlannetList()
                        })
                }
            }
            .navigationTitle("My Planet List")
        }
    }
}

struct PlanetListView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetListView()
    }
}

struct planetList : View{
    var name:String
    var climate:String
    var id:Int
    
    let randomImageUrl = "https://picsum.photos/200/300?random="
    let planetName = "Planet Name: "
    let planetClimate = "Planet Climate: "
    
    var body: some View{
        HStack{
            AnimatedImage(url: URL(string: randomImageUrl+"\(id)"))
                .resizable()
                .frame(width: 30, height: 30)
            
            
            VStack{
                HStack{
                    Text(planetName)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                    Text(name)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                }
                
                HStack{
                    Text(planetClimate)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                    Text(climate)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                }
            }
        }
        
    }
}

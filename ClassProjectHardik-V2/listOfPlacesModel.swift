//
//  listOfPlacesModel.swift
//  ClassProjectHardik-V2
//
//  Created by Hardik Gupta on 4/21/20.
//  Copyright © 2020 Hardik Gupta. All rights reserved.
//

import Foundation
class cities
{
    var cities:[city] = []
    
    init()
    {
        
        
    }
    
    func getCount() -> Int
    {
        return cities.count
    }
    
    func getCityObject(item:Int) -> city{
        
        return cities[item]
    }
    
    func location(s : String) -> Int{
        var count :  Int =  0;
        for x in cities{
            if (x.cityName == s){
                break;
            }
            count = count + 1
        }
        if (cities.count-1 < count){
            
            return -1
        }
        
        return count
    }
    func removeCityObject(item:Int) {
            cities.remove(at: item)
         
    }
    
    func addCityObject(name:String) -> city{
        let f = city(fn: name)
        cities.append(f)
        return f
        print("Success")
    }
    
}
class city
{
    var cityName:String?
    
    
    init(fn:String)
    {
        cityName = fn
    }
    
    
}

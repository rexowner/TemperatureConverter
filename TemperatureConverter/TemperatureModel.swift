//
//  TemperatureModel.swift
//  TemperatureConverter
//
//  Created by Les Poltrack on 11/19/21.
//

import Foundation

// NOT SURE THIS ENUM IS NEEDED...
enum TemperatureScale {
    case celsius
    case fahrenheit
    case kelvin
    case rankine
}
// NOT SURE ABOVE ENUEM NEEDED

struct TemperatureModel {
    
    // CONSTANTS
    let celsiusAbsoluteZero = -273.15
    let rankineMultiplier = 1.8
    let fahrenheitAbsoluteZero = -459.67
    
    var kelvin: Double //Current temperature in **Kelvin** is source of truth
    var celsius: Double {
        get {return kelvin + celsiusAbsoluteZero}
        set {kelvin = newValue - celsiusAbsoluteZero}
    }
    var rankine: Double {
        get {return kelvin * rankineMultiplier}
        set {kelvin = newValue / rankineMultiplier}
    }
    var fahrenheit: Double {
        get {return rankine + fahrenheitAbsoluteZero}
        set {rankine = newValue - fahrenheitAbsoluteZero}
    }
    
    init(kelvin k: Double) {
        kelvin = k
    }
    init(celsius c: Double) {
        kelvin = c - celsiusAbsoluteZero
    }
    init(rankine r: Double) {
        kelvin = r / rankineMultiplier
    }
    init(fahrenheit f: Double) {
        kelvin = (f - fahrenheitAbsoluteZero) / rankineMultiplier 
    }
    
}

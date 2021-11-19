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
    let celsiusAdder = 273.15
    
    var kelvin: Double //Current temperature in **Kelvin** is source of truth
    
    var celsius: Double {
        get {return kelvin - celsiusAdder}
        set {kelvin = newValue + celsiusAdder}
    }
    
    init(kelvin k: Double) {
        kelvin = k
    }
    init(celsius c: Double) {
        kelvin = c + celsiusAdder
    }
    
}

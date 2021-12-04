//
//  TemperatureModel.swift
//  TemperatureConverter Project
//
//  Final Project
//  CIS 137 OL
//  Group 4
//  Conrad Boucher & Les Poltrack
//  conradboucher@my.smccd.edu
//  lespoltrack@my.smccd.edu
//  This is the model for the app
//  December 4, 2021
//
//

import Foundation

// NOT SURE THIS ENUM IS NEEDED...
enum TemperatureScale {
    case celsius
    case fahrenheit
    case kelvin
    case rankine
}
// NOT SURE ABOVE ENUM NEEDED

struct TemperatureModel {
    
    // CONSTANTS
    let celsiusAbsoluteZero = -273.15    // Equivalent to Kelvin = 0
    let rankineMultiplier = 1.8          // Rankine degrees vs. Kelvin degrees
    let fahrenheitAbsoluteZero = -459.67 // Equivalent to Rankine = 0
    
    var kelvin: Double                  //Temperature in *Kelvin* is source of truth
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
    
    // Additional initializer may not be necessary, but easy to do
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

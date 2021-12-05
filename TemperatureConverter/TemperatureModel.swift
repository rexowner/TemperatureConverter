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
//
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
    var inputFromTextEdit: Bool = false
    
    var kelvin: Double                 //Temperature in *Kelvin* is source of truth

    var celsius: Double {
         get {var estCelsius = kelvin + celsiusAbsoluteZero
            // Hack so it looks like close to Freezing, when set by Slider -> 0 deg C
            if !inputFromTextEdit && (estCelsius > -0.3 && estCelsius < 0.3) {
                //kelvin = 273.15
                estCelsius = 0
            }
            // Hack so it looks like close to Body Temp, when set by Slider -> 37 deg C
            if !inputFromTextEdit && (estCelsius > 36.7 && estCelsius < 37.3) {
                estCelsius = 37
            }
            return estCelsius
        }
        set {kelvin = newValue - celsiusAbsoluteZero}
    }
    var rankine: Double {
        get {return kelvin * rankineMultiplier}
        set {kelvin = newValue / rankineMultiplier}
    }
    var fahrenheit: Double {
        get {var estFahr = rankine + fahrenheitAbsoluteZero
            // Hack so it looks like close to Freezing, when set by Slider -> 32 deg F
            if !inputFromTextEdit && (estFahr > 31.7 && estFahr < 32.3) {
                estFahr = 32
            }
            // Hack so it looks like close to Body Temp, when set by Slider -> 98.6 deg F
            if !inputFromTextEdit && (estFahr > 98.3 && estFahr < 98.9) {
                estFahr = 98.6
            }
           return estFahr
        }
        set {rankine = newValue - fahrenheitAbsoluteZero}
    }
    
    // Initializers
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

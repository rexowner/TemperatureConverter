//
//  TemperatureStore.swift
//  TemperatureConverter Project
//
//  Final Project
//  CIS 137 OL
//  Group 4
//  Conrad Boucher & Les Poltrack
//  conradboucher@my.smccd.edu
//  lespoltrack@my.smccd.edu
//
//  This is the viewmodel for the app
//  December 4, 2021
////
//

import SwiftUI

class TemperatureStore: ObservableObject {
    
    let kelvinWaterBoiling = 373.15
    let thermometerHeight: CGFloat
 //   var bulbLocation: CGFloat
    
    @Published private var model: TemperatureModel = CreateModel()
    
    init(thermometerHeight: CGFloat) {
        self.thermometerHeight = thermometerHeight
    }
    
    static func CreateModel() -> TemperatureModel {
        return TemperatureModel(kelvin: 373.15)
    }
    
    func dragTemperature(position: CGFloat) {
        model.kelvin = (kelvinWaterBoiling / Double(thermometerHeight)) * Double(thermometerHeight - position)
    }
    var kelvin: Double {
        return model.kelvin
    }
    var celsius: Double {
        return model.celsius
    }
    var fahrenheit: Double {
        return model.fahrenheit
    }
    var rankine: Double {
        return model.rankine
    }
    
    func setFahrenheit(_ value: Double) {
        model.fahrenheit = value
    }
    
    //adding dynamic color change to thermometer
    var color: Color {
        return model.color
    }
}

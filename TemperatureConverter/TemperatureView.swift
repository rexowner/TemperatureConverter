//
//  TemperatureView.swift
//  TemperatureConverter Project
//
//  Final Project
//  CIS 137 OL
//  Group 4
//  Conrad Boucher & Les Poltrack
//  conradboucher@my.smccd.edu
//  lespoltrack@my.smccd.edu
//  This is the primary view when the app is entered
//  December 4, 2021
//

import SwiftUI

struct TemperatureView: View {
    @GestureState private var offset: CGSize = .zero
    @State private var location: CGPoint = CGPoint(x: 50, y:200)
    
    var thermometerHeight: CGFloat
    let thermometerWidth: CGFloat
    let thermometerYOffset: CGFloat
    let bulbDiameter: CGFloat = 60

    init() {
        thermometerWidth = 40
        thermometerYOffset = 20

        var screenWidth: CGFloat
        var screenHeight: CGFloat
        #if os(macOS)  // on Mac, not full screen width, just do a window
            screenWidth = 500.0
        #else  // on iOS, use the full screen size
            screenWidth = UIScreen.main.bounds.width
            screenHeight = UIScreen.main.bounds.height
        #endif
        
        thermometerHeight = screenHeight * 2.0 / 3.0
        

    }
    
    var body: some View {

        let dragTemperature = DragGesture()
            .onChanged { value in
                self.location.y = min(400, max(0.0, value.location.y))
            }
        
        VStack {
            Rectangle()
                .fill(Color.white)
                .frame(height: 100)
            HStack {
                VStack {
                    Text("Fahrenheit")
                        .foregroundColor(.blue)
                        .font(.title)
                    Text("###")
                        .foregroundColor(.red)
                        .font(.title2)
                        .padding(.bottom, 30)
                    Text("Celsius")
                        .foregroundColor(.blue)
                        .font(.title)
                    Text("###")
                        .foregroundColor(.red)
                        .font(.title2)
                        .padding(.bottom, 30)
                    Text("Kelvin")
                        .foregroundColor(.blue)
                        .font(.title)
                    Text("###")
                        .foregroundColor(.red)
                        .font(.title2)
                        .padding(.bottom, 30)
                    Text("Rankine")
                        .foregroundColor(.blue)
                        .font(.title)

                    Text("###")
                        .foregroundColor(.red)
                        .font(.title2)
                        .padding(.bottom, 30)

                    Spacer()
/*                    Text("Location: \(Int(location.y))")
                        .padding()
                        .frame(width: 150)
  */              }
                ZStack(alignment: .top) {
                    Rectangle()
                        .fill(Color.red)
                        .border(Color.black, width: 1)
                        .cornerRadius(20)
                        .frame(width: thermometerWidth, height: thermometerHeight)
                    Rectangle()
                        .fill(Color.white)
                        .border(Color.black, width: 1)
                        .frame(width: thermometerWidth, height: location.y)
                    Circle()
                        .fill(Color.purple)
                        .frame(width: thermometerWidth, height:thermometerWidth)
                        .position(location)
                        .gesture(dragTemperature)
                    Circle()
                        .fill(Color.red)
                        .frame(width:bulbDiameter, height: bulbDiameter)
                        .position( CGPoint(x: 50, y:thermometerHeight))
                    Circle()
                        .fill(Color.purple)
                        .frame(width: thermometerWidth, height:thermometerWidth)
                        .position(location)
                        .gesture(dragTemperature)
                }
                .frame(width: 100)
                VStack {
                    Text("Water Boils")
                        .foregroundColor(.black)
                        .font(.headline)
                    Spacer()
                    Text("Absolute Zero")
                    .foregroundColor(.black)
                    .font(.headline)
                        .position(x: 0, y: thermometerHeight)
                }
            }
        }

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView()
    }
}

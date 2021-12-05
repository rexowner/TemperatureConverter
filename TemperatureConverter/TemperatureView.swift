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
//
//  This is the primary view when the app is entered
//  December 4, 2021
//

import SwiftUI

struct TemperatureView: View {
    @ObservedObject var viewModel: TemperatureStore
    
    @GestureState private var offset: CGSize = .zero
    @State private var bulbLocation: CGPoint = CGPoint(x: 40, y:0)
    
    var thermometerHeight: CGFloat
    let thermometerWidth: CGFloat
    let thermometerYOffset: CGFloat
    let bulbDiameter: CGFloat = 60

    @State private var setFahrenheit = "212.0"
    
    init() {
        thermometerWidth = 40
        thermometerYOffset = 10
        var screenWidth: CGFloat
        var screenHeight: CGFloat
        #if os(macOS)  // on Mac, not full screen width, just do a window
            screenWidth = 500.0
        #else  // on iOS, use the full screen size
            screenWidth = UIScreen.main.bounds.width
            screenHeight = UIScreen.main.bounds.height
        #endif
        
        thermometerHeight = (((screenHeight * 2.0 / 3.0) / 100.0).rounded(.down)) * 100
        viewModel = TemperatureStore(thermometerHeight: thermometerHeight)
    }
    
    var body: some View {

        let dragTemperature = DragGesture()
            .onChanged { value in
                self.bulbLocation.y = min(thermometerHeight, max(0.0, value.location.y))
                viewModel.dragTemperature(position: bulbLocation.y)
            }
        
        NavigationView {
            VStack {
                HStack(alignment: .top) {
                    VStack {
                        // Fahrenheit Text Button and read-out
                        NavigationLink(
                            destination: ScaleDetailView(
                                title: "Fahrenheit Scale",
                                bodyText: fahrenheitText,
                                link: "https://en.wikipedia.org/wiki/Fahrenheit"),
                            label: {
                                Text("Fahrenheit")
                                    .foregroundColor(.blue)
                                    .font(.title)
                            })
                        Text("\(viewModel.fahrenheit, specifier: "%.1f") \u{00b0}F")
                            .foregroundColor(.red)
                            .font(.title2)
                            .padding(.bottom, 30)
    
                        
                        // Celsius Text Button and read-out
                        NavigationLink(
                            destination: ScaleDetailView(
                                title: "Celsius Scale",
                                bodyText: celsiusText,
                                link: "https://en.wikipedia.org/wiki/Celsius"),
                            label: {Text("Celsius")
                            .foregroundColor(.blue)
                            .font(.title)
                            })
                        Text("\(viewModel.celsius, specifier: "%.1f") \u{00b0}C")
                            .foregroundColor(.red)
                            .font(.title2)
                            .padding(.bottom, 30)
                        
                        // Kelvin Text Button and read-out
                        NavigationLink(
                            destination: ScaleDetailView(
                                title: "Kelvin Scale",
                                bodyText: kelvinText,
                                link: "https://en.wikipedia.org/wiki/Kelvin"),
                            label: {Text("Kelvin")
                            .foregroundColor(.blue)
                            .font(.title)
                            })
                        Text("\(viewModel.kelvin, specifier: "%.2f") \u{00b0}K")
                            .foregroundColor(.red)
                            .font(.title2)
                            .padding(.bottom, 30)
                        
                        
                        // Rankine Text Button and read-out

                        NavigationLink(
                            destination: ScaleDetailView(
                                title: "Rankine Scale",
                                bodyText: rankineText,
                                link: "https://en.wikipedia.org/wiki/Rankine_scale"),
                            label: {Text("Rankine")
                            .foregroundColor(.blue)
                            .font(.title)
                            })

                        Text("\(viewModel.rankine, specifier: "%.2f") \u{00b0}R")
                            .foregroundColor(.red)
                            .font(.title2)
                            .padding(.bottom, 30)

                        Spacer()
                        Text("Location: \(Int(bulbLocation.y))")
                            .padding()
                            .frame(width: 150)
                    }
                    .padding(.top, 30)
                    
                    //VStack defines the Thermometer illustration
                    ZStack(alignment: .top) {
                        // Following rectangle is "bottom" "mercury" portion of thermometer
                        Rectangle()
                            .fill(Color.red)
                            .border(Color.black, width: 1)
                            .cornerRadius(20)
                            .frame(width: thermometerWidth, height: thermometerHeight)
                            .offset(y: thermometerYOffset)

                        
                        // Following rectangle is "top" empty portion of thermometer
                        Rectangle()
                            .fill(Color.white)
                            .border(Color.black, width: 1)
                            .frame(width: thermometerWidth, height: bulbLocation.y)
                            .offset(y: thermometerYOffset)
                        
                        // Following circle is the "bulb" at bottom
                        Circle()
                            .fill(Color.red)
                            .frame(width:bulbDiameter, height: bulbDiameter)
                            .position( CGPoint(x: 40, y:thermometerHeight))
                            .offset(y: thermometerYOffset)

                        
                        // Following Circle indicates temperature
                        Circle()
                            .fill(meniscusColor)
                            .frame(width: thermometerWidth, height:thermometerWidth)
                            .position(bulbLocation)
                            .gesture(dragTemperature)
                            .offset(y: thermometerYOffset)

                    }
                    .frame(width: 80)
                    VStack(alignment: .leading) {
                        Text("- Water Boils")
                            .foregroundColor(.black)
                            .font(.headline)
                        
                        Text("- Water Freezes")
                        .foregroundColor(.black)
                        .font(.headline)
                            .padding(.top, thermometerHeight * 100.0/373.15)

                        
                        Text("- Absolute Zero")
                        .foregroundColor(.black)
                        .font(.headline)
                            .padding(.top, thermometerHeight * 273.15/373.15)

                    }
                }
            }.navigationTitle("Temperature Scales")
        }
    }
    
    let fahrenheitText = "The Fahrenheit scale was established in 1724.\n\nIt is named for Daniel Gabriel Fahrenheit.\n\nAccording to legend, 0\u{00b0}F was established as the freezing temperature of a mixture of water and a salt, and 90\u{00b0}F was an (incorrect) estimate of human body temperature.  \n\nThe scale is used in only a few countries, including Liberia, parts of Belize, a few Caribbianm nations and the United States."
    let celsiusText = "The current Celsius scale was established in 1743.\n\nIt is hamed for Anders Celsius, who lived from 1701-1744.\n\n0\u{00b0}C and 100\u{00b0}Care respectively the freezing and boiling points of water.\n\nThe Celsius scale is the most common temperature scale used in most of the world."
    let kelvinText = "The Kelvin scale was established circa 1848 by William Thomson, who was later made \"Lord Kelvin\" by the British Monarchy.\n\n0\u{00b0} on the Kelvin Scale is Absolute Zero, and no matter can have a temperature lower than that.  Degrees are the same size as Celsius degrees.\n\nThe Kelvin scale is widely used for scientific and technical purposes throughout the world."
    let rankineText = "The Rankine Scale was established in 1859.\n\nIt is named for Macquorn Rankine.\n\nZero (0\u{00b0}R) on the Rankine Scale is 'Absolute Zero.'  A temperature difference on the Rankine scale is the same as the Fahrenheit scale, so its relationship to the Fahrenheit scale is analagous to the Kelvin scale to Celsius.\n\nIt is still used in physical sciences and engineering when heat differences are measured in Fahrenheit degrees."
    let meniscusColor = Color(red: 0.8, green: 0.0, blue: 0.0)


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView()
    }
}

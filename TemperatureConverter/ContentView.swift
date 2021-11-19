//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Les Poltrack on 11/10/21.
//

import SwiftUI

struct ContentView: View {
    @GestureState private var offset: CGSize = .zero
    @State private var location: CGPoint = CGPoint(x: 50, y:200)
    
    let thermometerHeight: CGFloat
    let thermometerWidth: CGFloat
    let thermometerYOffset: CGFloat
    let bulbDiameter: CGFloat = 60

    init() {
        thermometerHeight = 400
        thermometerWidth = 40
        thermometerYOffset = 20
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
                        .font(.title)
                    Spacer()
                    Text("Absolute Zero")
                    .foregroundColor(.black)
                    .font(.title)
                        .position(x: 0, y: thermometerHeight)
                }
            }
        }

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

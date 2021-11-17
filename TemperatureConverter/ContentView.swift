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
                        .frame(width: 40, height: 400)
                    Rectangle()
                        .fill(Color.white)
                        .border(Color.black, width: 1)
                        .frame(width: 40, height: location.y)

                    Circle()
                        .fill(Color.purple)
                        .frame(width: 36, height:36)
                        .position(location)
                        .gesture(dragTemperature)
                    Circle()
                        .fill(Color.red)
                        .frame(width:60, height: 60)
                        .position( CGPoint(x: 50, y:400))
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
                        .position(x: 0, y: 400)

                }
            }
            Spacer()
        }

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

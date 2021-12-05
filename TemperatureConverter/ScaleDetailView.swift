//
//  ScaleDetailView.swift
//  TemperatureConverter Project
//
//  Final Project
//  CIS 137 OL
//  Group 4
//  Conrad Boucher & Les Poltrack
//  conradboucher@my.smccd.edu
//  lespoltrack@my.smccd.edu
//
//  This file presents more detailed information on each of the scales
//  December 4, 2021
//
//

import SwiftUI

struct ScaleDetailView: View {
    let title: String
    let bodyText: String
    let link: String
    

    init(title: String, bodyText: String, link: String) {
        self.title = title
        self.bodyText = bodyText
        self.link = link
    }
    
    var body: some View {
    
        VStack {

            Text(title)
                .font(.largeTitle)
                .padding(15)
            Text(bodyText)
            Link(destination: URL(string: link)!) {
                Text("Learn More...")
                    .font(.largeTitle)
            }
            Spacer()
        }
    }
    
}

struct ScaleDetail_Previews: PreviewProvider {
    static var previews: some View {
        ScaleDetailView(title: "Rankine Scale", bodyText: "The Rankine Scale was established in 1859.\n\nZero on the Rankine Scale is 'Absolute Zero.'  A temperature difference on the Rankine scale is the same as the Fahrenheit scale, so its relationship to the Fahrenheit scale is analagous to the Kelvin scale to Celsius.\n\nIt is still used in physical sciences and engineering when heat differences are measured in Fahrenheit degrees.", link: "https://en.wikipedia.org/wiki/Rankine_scale")
    }
}

/* TODO: Workaround
class Model: ObservableObject {
    @Published var pushed = false
}

struct MyBackButton: View {
    let label: String
    let closure: () -> ()

    var body: some View {
        Button(action: { self.closure() }) {
            HStack {
                Image(systemName: "chevron.left")
                Text(label)
            }
        }
    }
}
 */

//
//  ScaleDetail.swift
//  TemperatureConverter
//
//  Created by Les Poltrack on 11/17/21.
//

import SwiftUI

struct ScaleDetail: View {
    var body: some View {
    
        VStack {
            Text("Rankine Scale")
                .font(.largeTitle)
            Text("The Rankine Scale was established in 1859.\n\nZero on the Rankine Scale is 'Absolute Zero.'  A temperature difference on the Rankine scale is the same as the Fahrenheit scale, so its relationship to the Fahrenheit scale is analagous to the Kelvin scale to Celsius.\n\nIt is still used in physical sciences and engineering when heat differences are measured in Fahrenheit degrees.")
            Text("Learn More....")
                .foregroundColor(Color.blue)
                .font(.title)
            Spacer()
        }
    }
}

struct ScaleDetail_Previews: PreviewProvider {
    static var previews: some View {
        ScaleDetail()
    }
}

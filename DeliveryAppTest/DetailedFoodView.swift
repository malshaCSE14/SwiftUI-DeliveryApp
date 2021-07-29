//
//  DetailedFoodView.swift
//  DeliveryAppTest
//
//  Created by Malsha Hansini on 30/05/2021.
//

import SwiftUI

struct DetailedFoodView: View {
    var body: some View {
        VStack {
            Spacer()
            Image("chickenBurger")
            Text("The burger description")
                .padding()
            Spacer()
        }
        .navigationTitle("buger")
        .navigationBarTitleDisplayMode(.large)
    }
    
}

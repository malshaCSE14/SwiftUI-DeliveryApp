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
            AsyncImage(url: URL(string: "https://www.hackingwithswift.com/img/paul.png")!,
                       placeholder: { Text("Loading ...") },
                       image: { Image(uiImage: $0).resizable() })
            Text("The burger description")
                .padding()
            Spacer()
        }
        .navigationTitle("buger")
        .navigationBarTitleDisplayMode(.large)
    }
    
}

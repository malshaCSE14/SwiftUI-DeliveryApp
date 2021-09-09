//
//  CartView.swift
//  DeliveryAppTest
//
//  Created by Malsha Hansini on 25/06/2021.
//

import SwiftUI

struct CartView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("My Order")
                .font(.title)
            ScrollView {
                VStack {
                    ForEach(items) { item in
                        FoodItem(item: item)
                        
                    }
                }
                ProceedButton()
            }
        }
    }
    
    struct ProceedButton: View {
        var body: some View {
            Button(action: {
                print("Proceed tapped!")
            }) {
                HStack {
                    Text("Proceed")
                        .fontWeight(.semibold)
                        .font(.title)
                    Image(systemName: "cart")
                        .font(.title)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(40)
            }
        }
    }
}

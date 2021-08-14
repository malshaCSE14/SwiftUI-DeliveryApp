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
                    FoodItem()
                    FoodItem()
                    FoodItem()
                }
            }
            ProceedButton()
        }
    }
}

struct CartItem: View {
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https://www.hackingwithswift.com/img/paul.png")!,
                       placeholder: { Text("Loading ...") },
                       image: { Image(uiImage: $0).resizable() })
                .scaledToFit()
                .frame(width: 100.0, height: 100.0)
                .padding([.top, .bottom])
                .padding([.leading, .trailing], 10)
                .background(Color.green)
                .cornerRadius(25.0)
            VStack(alignment:.leading) {
                Text("Burger")
                    .font(.title2)
                Text("$10")
                    .foregroundColor(.secondary)
                Text("The burger description on multiple linesssssss")
                    .foregroundColor(.secondary)
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(25.0)
        .padding(.all, 15)
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

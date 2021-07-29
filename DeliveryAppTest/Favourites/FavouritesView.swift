//
//  FavouritesView.swift
//  DeliveryAppTest
//
//  Created by Malsha Hansini on 25/06/2021.
//

import SwiftUI

struct FavouritesView: View {
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

struct FavouritesItem: View {
    var body: some View {
        HStack {
            Image("chickenBurger")
                .resizable()
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

//
//  FoodCategoriesView.swift
//  DeliveryAppTest
//
//  Created by Malsha Hansini on 27/06/2021.
//

import SwiftUI

struct FoodCategoriesView: View {
    let foodCategories: [FoodCategory] = [
        FoodCategory(name: "Baverages", imageName: "coke", color: Color.orange.opacity(0.5), imageWidth: 38),
        FoodCategory(name: "Snacks", imageName: "nuggets", color: Color.yellow.opacity(0.5), imageWidth: 45),
        FoodCategory(name: "Chicken Burger", imageName: "chickenBurger", color: Color.secondary.opacity(0.5), imageWidth: 56)
    ]
    var body: some View {
        ScrollView(.horizontal) {
            HStack{
                ForEach(foodCategories) { category in
                    HStack {
                        Image(category.imageName)
                            .resizable()
                            .frame(width: category.imageWidth, height: 55.0)
                        Text(category.name)
                    }
                    .padding([.leading, .trailing])
                    .padding([.top, .bottom], 4)
                    .background(category.color)
                    .cornerRadius(10)
                }
            }
            .padding(.top)
        }.padding()
    }
}

//
//  FoodCategoriesView.swift
//  DeliveryAppTest
//
//  Created by Malsha Hansini on 27/06/2021.
//

import SwiftUI

struct FoodCategoriesView: View {
    let foodCategories: [FoodCategory] = [
        FoodCategory(type: FoodType.pizza, imageName: ImageURLs.pizza.rawValue, color: Color.orange.opacity(0.5), imageWidth: 53),
        FoodCategory(type: FoodType.iceCream, imageName: ImageURLs.iceCream.rawValue, color: Color.yellow.opacity(0.5), imageWidth: 38),
        FoodCategory(type: FoodType.baverages, imageName: ImageURLs.coke.rawValue, color: Color.orange.opacity(0.5), imageWidth: 38),
        FoodCategory(type: FoodType.cake, imageName: ImageURLs.cake.rawValue, color: Color.secondary.opacity(0.5), imageWidth: 56),
        FoodCategory(type: FoodType.burger, imageName: ImageURLs.burger.rawValue, color: Color.yellow.opacity(0.5), imageWidth: 55),
    ]
    
    @EnvironmentObject var sourceRectBindings: CategorySelection
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack{
                ForEach(foodCategories) { category in
                    HStack {
                        AsyncImage(url: URL(string: category.imageName)!,
                                   placeholder: { Text("Loading ...") },
                                   image: { Image(uiImage: $0).resizable() })
                            .frame(width: category.imageWidth, height: 55.0)
                        Text(category.type.rawValue)
                    }
                    .padding([.leading, .trailing])
                    .padding([.top, .bottom], 4)
                    .background(category.color)
                    .cornerRadius(10)
                    .onTapGesture {
                        sourceRectBindings.category = category.type
                    }
                }
            }
            .padding(.top)
        }.padding()
    }
}

class CategorySelection: ObservableObject {
    @Published var category = FoodType.pizza
}

class CartItems: ObservableObject {
    @Published var items = [FoodCard]()
}

class PaymentCard: ObservableObject {
    @Published var card: String
    @Published var brand: String
    
    init(card: String, brand: String) {
        self.card = card
        self.brand = brand
    }
}

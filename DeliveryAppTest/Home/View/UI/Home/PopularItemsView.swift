//
//  PopularItemsView.swift
//  DeliveryAppTest
//
//  Created by Malsha Hansini on 27/06/2021.
//

import SwiftUI

struct PopularItemsView: View {
    @State private var rating = 4
    var body: some View {
        let foodCards: [FoodCard] = [
            FoodCard(name: "Beef Steak", imageName: ImageURLs.beefSteak.rawValue, introduction: "BB’s double beef patty (340g)", description: "desc", price: 10.0),
//            FoodCard(name: "Mushroom Pizza", imageName: ImageURLs.pizza.rawValue, introduction: "qwagrzfverty", description: "desc", price: 12.0),
//            FoodCard(name: "Burger", imageName: ImageURLs.burger.rawValue, introduction: "qwezfdcrty", description: "desc", price: 14.0)
            Food.getArray(type: FoodType.pizza, index: 0).first!,
            Food.getArray(type: FoodType.burger, index: 2).first!
        ]
        ScrollView(.horizontal) {
            HStack{
                ForEach(foodCards) { foodCard in
                    HStack {
                        AsyncImage(url: URL(string: foodCard.imageName)!,
                                   placeholder: { Text("Loading ...") },
                                   image: { Image(uiImage: $0).resizable() })
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                        VStack {
                            Text(foodCard.name).fontWeight(.bold)
                            RatingView(rating: $rating).padding(.trailing)
                            Text("$\(foodCard.price, specifier: "%.2f")")
                        }
                    }
                    .frame(width: 180, height: 80)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color("shadowGray"), radius: 10.0)
                    .frame(width: 210, height: 130)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
    }
}

struct RatingView: View {
    @Binding var rating: Int
    
    var label = ""
    
    var maximumRating = 5
    
    var offImage = Image(systemName: "star").resizable()
    var onImage = Image(systemName: "star.fill").resizable()
    
    var offColor = Color("shadowGray")
    var onColor = Color.yellow
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage
        } else {
            return onImage
        }
    }
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1) { number in
                self.image(for: number)
                    .foregroundColor(self.onColor)
                    .padding(-2)
                    .frame(width: 10, height: 10)
            }
        }
    }
}

//
//  FoodCardView.swift
//  DeliveryAppTest
//
//  Created by Malsha Hansini on 27/06/2021.
//

import SwiftUI

struct FoodCardView: View  {
    var body: some View {
        let foodCards: [FoodCard] = [
            FoodCard(name: "Beef Steak", imageName: "https://www.hackingwithswift.com/img/paul.png", introduction: "BB’s double beef patty (340g)", description: "desc", price: 10.0),
            FoodCard(name: "Mushroom Pizza", imageName: "https://www.hackingwithswift.com/img/paul.png", introduction: "qwagrzfverty", description: "desc", price: 12.0),
            FoodCard(name: "Burger", imageName: "https://www.hackingwithswift.com/img/paul.png", introduction: "qwezfdcrty", description: "desc", price: 14.0)
        ]
        
        ScrollView(.horizontal) {
            HStack{
                ForEach(foodCards) { foodCard in
                    NavigationLink(destination: FoodDescriptionView(item: foodCard)) {
                    VStack {
                        AsyncImage(url: URL(string: foodCard.imageName)!,
                                   placeholder: { Text("Loading ...") },
                                   image: { Image(uiImage: $0).resizable() })
                            .scaledToFit()
                            .frame(width: 110, height: 110)
                        Text(foodCard.name).fontWeight(.bold)
                        Text(foodCard.introduction).font(.system(size: 15))
                        Text("$\(foodCard.price, specifier: "%.2f")")
                    }
                    .frame(width: 140, height: 220)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color("shadowGray"), radius: 15.0)
                    .frame(width: 190, height: 300)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

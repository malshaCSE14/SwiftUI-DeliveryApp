//
//  HomeVieModel.swift
//  DeliveryAppTest
//
//  Created by Malsha Hansini on 26/06/2021.
//

import SwiftUI
import Foundation

//extension HomeView {
class HomeViewModel: ObservableObject {
    @Published private(set) var foodItems: [FoodCard] = []
    @Published private(set) var popularFoodItems: [FoodCard] = []
    @Published var caetgory: String = ""
    
    init() {
        
    }
    
    func loadSearchResults() {
        self.foodItems = [
            FoodCard(name: "Beef Steak", imageName: "https://www.hackingwithswift.com/img/paul.png", introduction: "into", description: "desc", price: 10),
            FoodCard(name: "Mushroom Pizza", imageName: "https://www.hackingwithswift.com/img/paul.png", introduction: "into", description: "desc", price: 15)
        ]
    }
}
//}

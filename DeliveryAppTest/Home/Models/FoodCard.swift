//
//  FoodCard.swift
//  DeliveryAppTest
//
//  Created by Malsha Hansini on 26/06/2021.
//

import SwiftUI

struct FoodCard: Identifiable {
    var id = UUID()
    let name: String
    let imageName: String
    let introduction: String
    let description: String
    let price: Double
}

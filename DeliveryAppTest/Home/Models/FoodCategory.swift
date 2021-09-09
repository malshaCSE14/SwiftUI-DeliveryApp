//
//  FoodCategory.swift
//  DeliveryAppTest
//
//  Created by Malsha Hansini on 26/06/2021.
//

import SwiftUI

struct FoodCategory: Identifiable {
    var id = UUID()
    let type: FoodType
    let imageName: String
    let color: Color
    let imageWidth: CGFloat
}

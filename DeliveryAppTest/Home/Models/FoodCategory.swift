//
//  FoodCategory.swift
//  DeliveryAppTest
//
//  Created by Malsha Hansini on 26/06/2021.
//

import SwiftUI

struct FoodCategory: Identifiable {
    var id = UUID()
    let name: String
    let imageName: String
    let color: Color
    let imageWidth: CGFloat
}

enum Category {
    case pizza
    case burger
    case pasta
    case rice
    case baverages
    case iceCream
}

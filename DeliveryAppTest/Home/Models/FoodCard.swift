//
//  FoodCard.swift
//  DeliveryAppTest
//
//  Created by Malsha Hansini on 26/06/2021.
//

import SwiftUI

public struct FoodCard: Identifiable {
    public var id = UUID()
    public let name: String
    public let imageName: String
    public let introduction: String
    public let description: String
    public var price: Double
    public var count: Int?
}

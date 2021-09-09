//
//  Food.swift
//  DeliveryAppTest
//
//  Created by Malsha Hansini on 09/09/2021.
//

import Foundation

struct Food {
    func getArray(type: FoodType) -> [FoodCard] {
        switch type {
        case .pizza:
            return getPizzaArray()
        case .baverages:
            return getBaveragesArray()
        case .burger:
            return getBurgerArray()
        case .cake:
            return getCakeArray()
        case .iceCream:
            return getIceCreamArray()
        }
    }
    
    func getBurgerArray() -> [FoodCard] {
        return [
            FoodCard(name: "Chicken Burger", imageName: ImageURLs.burger.rawValue, introduction: "Burger Meal", description: "desc", price: 10.0),
            FoodCard(name: "Burger Meal", imageName: ImageURLs.burgerMeal.rawValue, introduction: "San Marzano tomatoes & mozzarella cheese", description: "desc", price: 8.0),
            FoodCard(name: "Fish Burger", imageName: ImageURLs.fishBurger.rawValue, introduction: "San Marzano tomatoes & mozzarella cheese", description: "desc", price: 12.0),
            FoodCard(name: "Triple Bypass Burger", imageName: ImageURLs.trippleBypassBurger.rawValue, introduction: "San Marzano tomatoes & mozzarella cheese", description: "desc", price: 25.0),
            FoodCard(name: "Spiecy Chicken Burger", imageName: ImageURLs.spiecyChickenBurger.rawValue, introduction: "San Marzano tomatoes & mozzarella cheese", description: "desc", price: 10.0),
            FoodCard(name: "Double Stack Burger", imageName: ImageURLs.doubleStackBurger.rawValue, introduction: "San Marzano tomatoes & mozzarella cheese", description: "desc", price: 22.0)
            
        ]
    }
    
    func getBaveragesArray() -> [FoodCard] {
        return [
            FoodCard(name: "Coke", imageName: ImageURLs.coke.rawValue, introduction: "Carbonated soft drink ", description: "desc", price: 11.0),
        ]
    }
    
    func getPizzaArray() -> [FoodCard] {
        return [
            FoodCard(name: "Mushroom Pizza", imageName: ImageURLs.pizza.rawValue, introduction: "Fresh buttery shiitake mushroom topping", description: "desc", price: 10.0),
            FoodCard(name: "Pizza Margherita", imageName: ImageURLs.pizzaMargherita.rawValue, introduction: "San Marzano tomatoes & mozzarella cheese", description: "desc", price: 12.0),
        ]
    }
    
    func getCakeArray() -> [FoodCard] {
        return [
            FoodCard(name: "Cake", imageName: ImageURLs.cake.rawValue, introduction: "Great taste in every bite", description: "desc", price: 32.0),
        ]
    }
    
    func getIceCreamArray() -> [FoodCard] {
        return [
            FoodCard(name: "Ice Cream", imageName: ImageURLs.iceCream.rawValue, introduction: "Brain freeze!", description: "desc", price: 5.0),
        ]
    }
}

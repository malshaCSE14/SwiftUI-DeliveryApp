//
//  CartView.swift
//  DeliveryAppTest
//
//  Created by Malsha Hansini on 25/06/2021.
//

import SwiftUI
import Stripe

struct CartView: View {
    @StateObject var cartItemsBinding: CartItems

    var body: some View {
        VStack {
            NavigationView {
                VStack(alignment: .trailing) {
                    Button(action: {
                        cartItemsBinding.items = [FoodCard]()
                    }) {
                        Text("Clear cart").foregroundColor(.orange).padding(.trailing)
                    }
                    ScrollView {
                        VStack(alignment: .leading) {
                            ForEach(cartItemsBinding.items) { item in
                                FoodItem(cartItemsBinding: cartItemsBinding, item: item, count: item.count ?? 1)
                            }
                        }
                    }
                    Spacer()
                    ProceedButton(cartItemsBinding: cartItemsBinding).environmentObject(cartItemsBinding)
                        .padding(.bottom)
                }.navigationBarTitle("Shopping Cart")
            }
        }
    }
}

struct ProceedButton: View {
    @StateObject var cartItemsBinding: CartItems

    @State var showAddCardView = true
    var body: some View {
        NavigationLink(destination: AddressView()) {
            HStack {
                Text("Total $")
                Text("\(cartItemsBinding.items.map{ $0.price * Double($0.count ?? 1) }.reduce(0, +), specifier: "%.2f")")
                    .fontWeight(.semibold)
                    .font(.title)
                Spacer()
                Text("Proceed")
                    .fontWeight(.semibold)
                    .font(.title)
                Image(systemName: "cart")
                    .font(.title)
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.green)
            .cornerRadius(40)
        }.padding(20)
    }
}

struct FoodItem: View {
    @StateObject var cartItemsBinding: CartItems
    let item: FoodCard
    @State var count: Int
    let colors = [Color.green, Color("Green2"), Color("Green1")]
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: item.imageName)!,
                       placeholder: { Text("Loading ...") },
                       image: { Image(uiImage: $0).resizable() })
                .scaledToFit()
                .frame(width: 100.0, height: 100.0)
                .padding([.top, .bottom])
                .padding([.leading, .trailing], 10)
                .background(colors[getIndex() ?? 0])
                .cornerRadius(25.0)
            VStack(alignment:.leading) {
                Text("\(item.name)")
                    .font(.title2)
                Text("$\(item.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                Text("\(item.introduction)")
                    .foregroundColor(.secondary)
            }
            Spacer()
            VStack {
                Button(action: {
                    count += 1
                    updateFoodItemPrice()
                }) {
                    Text("+").fontWeight(.bold).font(.title3)
                }
                Text("\(count)").fontWeight(.bold).padding([.top, .bottom])
                Button(action: {
                    if (count > 0) {
                        count -= 1
                        updateFoodItemPrice()
                    }
                }) {
                    Text("-").fontWeight(.bold).font(.title3)
                }
            }
            .frame(height: 100.0)
            .padding()
            .background(Color("shadowGray"))
            .cornerRadius(25)
        }
        .background(Color.white)
        .cornerRadius(25.0)
        .padding(15)
    }
    
    func getIndex() -> Int? {
        return cartItemsBinding.items.enumerated().filter({ $0.element.name == item.name }).map({ $0.offset }).first
    }
    func updateFoodItemPrice() {
        if let index = getIndex() {
            cartItemsBinding.items[index].count = count
        }
    }
}

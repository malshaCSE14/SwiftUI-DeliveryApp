//
//  CartView.swift
//  DeliveryAppTest
//
//  Created by Malsha Hansini on 25/06/2021.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartItemsBinding: CartItems

    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    ScrollView {
                        VStack(alignment: .leading) {
                            ForEach(items) { item in
                                FoodItem(item: item)
                            }
                        }
                    }
                    Spacer()
                    ProceedButton()
                        .padding(.bottom)
                }.navigationBarTitle("Shopping Cart")
            }
        }
    }
}

struct ProceedButton: View {
    var body: some View {
        Button(action: {
            print("Proceed tapped!")
        }) {
            HStack {
                Text("Total $")
                Text("\(items.map{ $0.price * Double($0.count ?? 1) }.reduce(0, +), specifier: "%.2f")")
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
    let item: FoodCard
    @State var count = 1
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: item.imageName)!,
                       placeholder: { Text("Loading ...") },
                       image: { Image(uiImage: $0).resizable() })
                .scaledToFit()
                .frame(width: 100.0, height: 100.0)
                .padding([.top, .bottom])
                .padding([.leading, .trailing], 10)
                .background(Color.green)
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
                }) {
                    Text("+").fontWeight(.bold).font(.title3)
                }.padding()
                Text("\(count)").fontWeight(.bold).padding()
                Button(action: {
                    if (count > 0) {
                        count -= 1
                    }
                }) {
                    Text("-").fontWeight(.bold).font(.title3)
                }.padding()
            }
            .background(Color("shadowGray"))
            .cornerRadius(8)
            .padding()
        }
        .background(Color.white)
        .cornerRadius(25.0)
        .padding([.leading, .top, .bottom], 15)
    }
}

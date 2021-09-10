//
//  FoodDescriptionView.swift
//  DeliveryAppTest
//
//  Created by Malsha Hansini on 30/06/2021.
//

import SwiftUI

public var items = [FoodCard]()

struct FoodDescriptionView: View {
    let item: FoodCard
    @State var count = 1
    
    // MARK: - BODY
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Spacer()
                }
                AsyncImage(url: URL(string: item.imageName)!,
                           placeholder: { Text("Loading ...") },
                           image: { Image(uiImage: $0).resizable() })
                    .scaledToFit()
                    .frame(width: 240, height: 240)
                    .shadow(radius: 20)
                    .padding()
                HStack {
                    Button(action: {
                        if (count > 0) {
                            count -= 1
                        }
                    }) {
                        Text("-").fontWeight(.bold).font(.title3)
                    }.padding(7)
                    Text("\(count)").fontWeight(.bold).padding(7)
                    Button(action: {
                        count += 1
                    }) {
                        Text("+").fontWeight(.bold).font(.title3)
                    }.padding(7)
                }
                .padding([.leading, .trailing], 10)
                .background(Color.yellow)
                .cornerRadius(26)
                .frame(width: 180, height: 50)
                .shadow(color: Color("shadowGray"), radius: 5)
            }
            .frame(height: 300)
            .background(Color("descriptionBackground").edgesIgnoringSafeArea([.trailing, .leading, .top]))
            DescriptionView(item: item, count: $count).padding()
        }
    }
    
}

struct DescriptionView: View {
    let item: FoodCard
    @State private var buttonText: String = "Add To Cart"
    @State private var buttonImage: String = "cart.fill.badge.plus"
    @State private var buttonColor: Color = .black
    //    @StateObject var addedItem = AddedCartItems()
    @Binding var count: Int
    var body: some View {
        VStack {
            HStack {
                Text(item.name).font(.title).bold()
                Spacer()
                Image(systemName: "stopwatch").foregroundColor(.green)
                Text("10-15 mins").foregroundColor(.gray)
            }.padding()
            Text("multi lined food description. multi lined food description. multi lined food description").font(.footnote).foregroundColor(.gray).lineSpacing(8).padding([.bottom], 5)
            TopingView()
            Spacer()
            HStack {
                VStack {
                    Text("Total Price").foregroundColor(.gray).font(.caption).bold()
                    HStack{
                        Text("$").foregroundColor(.yellow).bold().font(.title2)
                        Text("\(item.price * Double(count), specifier: "%.2f")").bold().font(.title2)
                    }
                }
                Spacer()
                Button(action: {
                    var addToCartItems = item
                    addToCartItems.count = count
                    items.append(addToCartItems)
                    buttonText = "Added!"
                    buttonImage = "checkmark.seal.fill"
                    buttonColor = .green
                }, label: {
                    Image(systemName: buttonImage)
                    Text(buttonText)
                        .padding()
                        .frame(width: 130)
                })
                .padding([.leading], 20)
                .padding([.trailing], 10)
                .background(buttonColor)
                .foregroundColor(.white)
                .cornerRadius(26)
                .shadow(color: Color("shadowGray"), radius: 8)
            }
            .padding([.bottom], 15)
        }
        
    }
}

struct TopingView: View {
    let toppingImg: [String] = [ImageURLs.cheese.rawValue, ImageURLs.sauce.rawValue, ImageURLs.pepper.rawValue, ImageURLs.onion.rawValue]
    var body: some View {
        VStack {
            HStack {
                Text("Topings for you").font(.title3).bold()
                Spacer()
                Text("Clear").foregroundColor(.orange)
                
            }
            HStack {
                ForEach(toppingImg, id: \.self) { imageName in
                    AsyncImage(url: URL(string: imageName)!,
                               placeholder: { Text("Loading ...") },
                               image: { Image(uiImage: $0).resizable() })
                        .background(Color("shadowGray").opacity(0.4))
                        .frame(width: 80, height: 80)
                        .cornerRadius(10.0)
                        .padding(4)
                }
            }
        }
    }
}

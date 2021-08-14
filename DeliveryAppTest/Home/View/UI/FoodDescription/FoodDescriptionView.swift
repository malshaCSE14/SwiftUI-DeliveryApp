//
//  FoodDescriptionView.swift
//  DeliveryAppTest
//
//  Created by Malsha Hansini on 30/06/2021.
//

import SwiftUI

struct FoodDescriptionView: View {
    let item: FoodCard
    // MARK: - BODY
    @State var count = 1

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
//                    Divider()
                    Text("\(count)").fontWeight(.bold).padding(7)
//                    Divider()
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
                
                                
//                Spacer()
            }
            .frame(height: 300)
            .background(Color("descriptionBackground").edgesIgnoringSafeArea([.trailing, .leading, .top]))
            DescriptionView(name: item.name).padding()
        }
    }
    
}

struct DescriptionView: View {
    let name: String
    var body: some View {
        VStack {
            HStack {
                Text(name).font(.title).bold()
                Spacer()
                Image(systemName: "stopwatch").foregroundColor(.green)
                Text("10-15 mins").foregroundColor(.gray)
            }.padding()
            Text("multi lined food description. multi lined food description. multi lined food description").font(.footnote).foregroundColor(.gray).lineSpacing(10)
            TopingView()
            HStack {
                VStack {
                    Text("Total Price").foregroundColor(.gray).font(.caption).bold()
                    HStack{
                        Text("$").foregroundColor(.yellow).bold().font(.title2)
                        Text("36.00").bold().font(.title2)
                    }
                }
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "cart.fill.badge.plus")
                    Text("Add To Cart")
                        .padding()
                })
//                .padding([.leading, .trailing], 10)
                .background(Color.black)
                .foregroundColor(.white)
//                .cornerRadius(26)
//                .frame(width: 180, height: 70)
//                .shadow(color: Color("shadowGray"), radius: 5)
            }
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

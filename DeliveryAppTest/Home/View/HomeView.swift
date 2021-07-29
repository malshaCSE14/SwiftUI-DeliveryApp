//
//  HomeView.swift
//  DeliveryAppTest
//
//  Created by Malsha Hansini on 30/05/2021.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTIES
    @State private var searchText: String = ""
    //@State private var text: String = ""
    
    //@ObservedObject var searchBar: SearchBar = SearchBar()
    
    // MARK: - BODY
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.leading, 8)
                        TextField("Search food here", text: $searchText)
                    }
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    //                    Image("slider.horizontal.3")
                    //
                    //                                        ForEach(animals.filter({_ in
                    //                                                                self.searchText.isEmpty ? true :
                    //                                                                    "$0".lowercased().contains(searchText.lowercased())})
                    //                                        )  {
                    //                                            animal in
                    //                                            HStack {
                    //                                                Image(animal.image)
                    //                                                    .resizable()
                    //                                                    .scaledToFit()
                    //                                                    .frame(width: 80, height: 80)
                    //
                    //                                                Text(animal.name)
                    //                                                    .font(.headline)
                    //                                                    .fontWeight(.bold)
                    //                                                Spacer()
                    //                                            }//: HSTACK
                    //                                            .padding()
                    //                                            Divider()
                    //                                        }//: LOOP
                    FoodCategoriesView()
                    Spacer()
                    FoodCardView()
                    HStack{
                        Text("Popular Items").fontWeight(.bold).font(.system(size: 20))
                        Spacer()
                        Text("See All").font(.system(size: 18)).foregroundColor(Color.orange)
                    }.padding([.leading, .trailing, .bottom])
                    PopularItemsView()
                }
                .navigationBarTitle("Search Food")
            }
        }
    }
}

struct FoodItem: View {
    var body: some View {
        HStack {
            Image("chickenBurger")
                .resizable()
                .scaledToFit()
                .frame(width: 100.0, height: 100.0)
                .padding([.top, .bottom])
                .padding([.leading, .trailing], 10)
                .background(Color.green)
                .cornerRadius(25.0)
            VStack(alignment:.leading) {
                Text("Burger")
                    .font(.title2)
                Text("$10")
                    .foregroundColor(.secondary)
                Text("The burger introduction on multiple linesssssss")
                    .foregroundColor(.secondary)
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(25.0)
        .padding(.all, 15)
    }
}


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
    @EnvironmentObject var sourceRectBindings: CategorySelection
    
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
                    FoodCategoriesView().environmentObject(sourceRectBindings)
                    Spacer()
                    FoodCardView().environmentObject(sourceRectBindings)
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
    let item: FoodCard
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https://www.hackingwithswift.com/img/paul.png")!,
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
                Text("\(item.price)")
                    .foregroundColor(.secondary)
                Text("\(item.description)")
                    .foregroundColor(.secondary)
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(25.0)
        .padding(.all, 15)
    }
}

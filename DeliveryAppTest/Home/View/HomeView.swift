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
    @StateObject var cartItemsBinding: CartItems
    
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
                    FoodCardView(cartItemsBinding: cartItemsBinding).environmentObject(sourceRectBindings)
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

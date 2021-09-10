//
//  ContentView.swift
//  DeliveryAppTest
//
//  Created by Malsha Hansini on 29/05/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cartItemsBinding = CartItems()

    var body: some View {
        TabView {
            HomeView(cartItemsBinding: cartItemsBinding)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .environmentObject(CategorySelection())
            FavouritesView()
                .tabItem {
                    Label("Favourites", systemImage: "suit.heart.fill")
                }
            CartView(cartItemsBinding: cartItemsBinding)
                .tabItem {
                    Label("Cart", systemImage: "cart.fill")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
        .accentColor(.black)
        .onAppear() {
            UITabBar.appearance().barTintColor = .white
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
//            ContentView()
//            HomeView( cartItemsBinding: cartItemsBinding)
//            FavouritesView()
//            CartView()
//            ProfileView()
        }
    }
}

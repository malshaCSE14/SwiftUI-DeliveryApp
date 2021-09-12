//
//  PaymentHandler.swift
//  DeliveryAppTest
//
//  Created by Malsha Hansini on 10/09/2021.
//

import Foundation
import Stripe
import SwiftUI

struct AddCardView: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var cardDetails: PaymentCard

    func makeUIViewController(context: Context) -> UINavigationController {
        // Setup add card view controller
        let config = STPPaymentConfiguration.shared
        config.publishableKey = "pk_test_51JYACeIdWsQgwec05MtoPTrR4uk89NyiFLl7vdIVWroX195wswX3geYRrO20wcFSeGbC7ugwkQC0gxs9sB44CVny00yvCLvnRW"
        let addCardViewController = STPAddCardViewController(configuration: config, theme: .defaultTheme)
        addCardViewController.delegate = context.coordinator
        let navigationController = UINavigationController(rootViewController: addCardViewController)
        navigationController.navigationBar.stp_theme = .defaultTheme
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        if let navController = uiViewController.navigationController,
           let navItem = navController.navigationBar.topItem {
            navItem.title = uiViewController.title
            navItem.rightBarButtonItem = uiViewController.navigationItem.rightBarButtonItem
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

class Coordinator: NSObject, STPAddCardViewControllerDelegate, UINavigationControllerDelegate {
    var parent: AddCardView

    func addCardViewControllerDidCancel(_ addCardViewController: STPAddCardViewController) {
        parent.presentation.wrappedValue.dismiss()
    }
    
    func addCardViewController(_ addCardViewController: STPAddCardViewController, didCreatePaymentMethod paymentMethod: STPPaymentMethod, completion: @escaping STPErrorBlock) {
        print(paymentMethod)
        parent.cardDetails.card = paymentMethod.card?.last4 ?? ""
        parent.cardDetails.brand = "\(paymentMethod.card?.networks?.available.first?.capitalized ?? "") - \(paymentMethod.card?.funding?.capitalized ?? "")"
        parent.presentation.wrappedValue.dismiss()
    }
    
    init(_ parent: AddCardView) {
        self.parent = parent
    }
}

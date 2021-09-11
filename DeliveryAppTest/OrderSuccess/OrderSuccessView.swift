//
//  OrderSuccessView.swift
//  DeliveryAppTest
//
//  Created by Malsha Hansini on 11/09/2021.
//

import Lottie
import SwiftUI

struct OrderSuccessView: View {
    var body: some View {
        VStack{
        LottieView(name: "delivery", loopMode: .repeat(1))
            .frame(width: 350, height: 350)
            Text("We will deliver to your doorsteps..!").font(.title3).padding()
            Text("Stay Home, Stay Safe!").font(.title3).fontWeight(.bold)
        }
    }
}

struct LottieView: UIViewRepresentable {
    var name: String
    var loopMode: LottieLoopMode = .playOnce
    
    var animationView = AnimationView()
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        animationView.animation = Animation.named(name)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {}
}

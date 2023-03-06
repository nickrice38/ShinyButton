//
//  ContentView.swift
//  ButtonExperiments
//
//  Created by Nick Rice on 03/03/2023.
//

import SwiftUI
import CameraView

struct ContentView: View {
    @State private var tap = false
    
    var body: some View {
        ZStack {
            Color("background").ignoresSafeArea()
            
            VStack {
                ZStack {
                    CameraView(cameraPosition: .front)
                        .scaleEffect(6)
                        .blur(radius: 10)
                        .overlay(
                            Rectangle()
                                .fill(.white)
                                .scaleEffect(2)
                                .rotationEffect(.degrees(-35))
                                .offset(x: -150)
                                .blendMode(.overlay)
                                .blur(radius: 6)
                                .opacity(0.15)
                        )
                        .saturation(0.34)
                        .brightness(0.12)
                        .saturation(0.85)
                        .frame(width: 300, height: 100)
                        .mask(RoundedRectangle(cornerRadius: 80)
                            .fill((Color("background"))
                                .shadow(.inner(color: .white.opacity(0.25), radius: 4, x: 0, y: 6))
                        ))
                    
                    Text("Button")
                        .font(.system(.title, weight: .semibold))
                        .foregroundColor(Color("text"))
                        .shadow(color: .white.opacity(0.19), radius: 2, x: 0, y: 0)
                        .shadow(color: .white.opacity(0.25), radius: 4, x: 0, y: 2)
                }
                .shadow(color: tap ? .white.opacity(0.25) : .black.opacity(0.2), radius: tap ? 9 : 8, x: 0, y: tap ? 3 : 12)
                .shadow(color: tap ? .white.opacity(0.25) : .black.opacity(0.1), radius: tap ? 10 : 32, x: 0, y: tap ? -4 : 6)
                
                
                ZStack {
                    RoundedRectangle(cornerRadius: 80)
                        .fill((Color("background"))
                            .shadow(.inner(color: tap ? .black.opacity(0.1) : .white.opacity(0.25), radius: tap ? 8 : 4, x: 0, y: 6))
                            .shadow(.inner(color: tap ? .black.opacity(0.1) : .white.opacity(0.3), radius: tap ? 8 : 2, x: 0, y: tap ? -2 : -1))
                        )
                        .frame(width: 300, height: 100)
                        .shadow(color: tap ? .white.opacity(0.25) : .black.opacity(0.2), radius: tap ? 9 : 8, x: 0, y: tap ? 3 : 12)
                        .shadow(color: tap ? .white.opacity(0.25) : .black.opacity(0.1), radius: tap ? 10 : 32, x: 0, y: tap ? -4 : 6)
                    
                    Text("Button")
                        .font(.system(.title, weight: .semibold))
                        .foregroundColor(Color("text"))
                }
                .onTapGesture {
                    tap = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        tap = false
                    }
                }
                .scaleEffect(tap ? 0.95 : 1)
                .animation(.spring(response: 0.4, dampingFraction: 0.6))
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  ButtonExperiments
//
//  Created by Nick Rice on 03/03/2023.
//

import SwiftUI
import CameraView
import CoreMotion

class MotionManager: ObservableObject {
    private let motionManager = CMMotionManager()
    @Published var x = 0.0
    
    init() {
        motionManager.startDeviceMotionUpdates(to: .main) { [weak self] data, error in
            
            guard let motion = data?.attitude else { return }
            self?.x = motion.roll
        }
    }
}

struct ContentView: View {
    @State private var tap1 = false
    @State private var tap2 = false
    @State private var gradientAngle: Double = 0
    @State private var showButtonTwo = false
    @StateObject private var motion = MotionManager()
    
    var body: some View {
        ZStack {
            Color("background").ignoresSafeArea()
            
            Button("Button Two") {
                showButtonTwo.toggle()
            }
            
            VStack(spacing: 120) {
                ZStack {
                    
                    //MARK: Camera
                    
                    CameraView(cameraPosition: .front)
                        .scaleEffect(6)
                        .blur(radius: 6)
                        .overlay(
                            RoundedRectangle(cornerRadius: 80)
                                .foregroundStyle(
                                    Color("fill").opacity(0.5)
                                    
                                    //MARK: Inner Shadows
                                    
                                        .shadow(.inner(color: tap1 ? .black.opacity(0.4) : .white, radius: tap1 ? 8 : 6, x: 0, y: 6))
                                        .shadow(.inner(color: tap1 ? .black.opacity(0.4) : .white, radius: tap1 ? 8 : 4, x: 0, y: -1))
                                )
                                .frame(width: 300, height: 100)
                        )
                    
                    //MARK: Gradient
                    
                        .overlay(
                            Circle()
                                .fill(
                                    AngularGradient(gradient: Gradient(colors: [Color("color1"), Color("color2"), Color("color3"), Color("color4"), Color("color5"), Color("color6"), Color("color7"), Color("color8"), Color("color1")]), center: .center)
                                    
                                )
                                .scaleEffect(5)
                                .offset(y: -70)
                                .rotationEffect(.degrees(25) * motion.x)
//                                .opacity(0.45)
                        )
                        .blendMode(.softLight)
                        .saturation(0.45)
                        .frame(width: 300, height: 100)
                        .mask(RoundedRectangle(cornerRadius: 80)
                            .fill((Color("background"))
                                 ))
                    
                    //MARK: Text
                    
                    Text("Button")
                        .font(.system(.title, weight: .semibold))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [Color("text1"), Color("text2")],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .opacity(0.8)
                        .shadow(color: .white.opacity(0.15), radius: 2, x: 0, y: 0)
                        .shadow(color: .white.opacity(0.15), radius: 4, x: 0, y: 2)
                    
                }
                
                //MARK: Drop Shadows
                
                .shadow(color: tap1 ? .white.opacity(0.2) : .black.opacity(0.25), radius: tap1 ? 9 : 8, x: 0, y: tap1 ? 3 : 12)
                .shadow(color: tap1 ? .white.opacity(0.2) : .black.opacity(0.15), radius: tap1 ? 10 : 32, x: 0, y: tap1 ? -4 : 6)
                
                .onTapGesture {
                    tap1 = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        tap1 = false
                    }
                }
                .scaleEffect(tap1 ? 0.96 : 1)
                .animation(.spring(response: 0.4, dampingFraction: 0.6))
                
//                if self.showButtonTwo {
//                    ButtonTwo()
//                } else {
//                    ButtonTwo().hidden()
//                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

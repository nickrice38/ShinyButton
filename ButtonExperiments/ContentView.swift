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
    @State private var tap = false
    @State private var gradientAngle: Double = 0
    @StateObject private var motion = MotionManager()
    
    var body: some View {
        ZStack {
            Color("background").ignoresSafeArea()
            
            VStack {
                ZStack {
                    CameraView(cameraPosition: .front)
                        .scaleEffect(6)
                        .blur(radius: 10)
                        .overlay(
                            Circle()
                                .fill(
                                    AngularGradient(gradient: Gradient(colors: [Color("color1"), Color("color2"), Color("color3"), Color("color4"), Color("color5"), Color("color6"), Color("color7"), Color("color8"), Color("color1")]), center: .center)
                                )
                                .scaleEffect(5)
                                .offset(y: -70)
                                .rotationEffect(.degrees(25) * motion.x)
                                .opacity(0.4)
                        )
                        .overlay(
                            Image("texture")
                                .resizable()
                                .opacity(0.2)
                                .offset(x: motion.x)
                        )
                        .blendMode(.overlay)
                        .saturation(0.34)
                        .brightness(0.08)
                        .saturation(0.95)
                        .frame(width: 300, height: 100)
                        .mask(RoundedRectangle(cornerRadius: 80)
                            .fill((Color("background"))
                        ))
                    
                    Text("Button")
                        .font(.system(.title, weight: .semibold))
                        .foregroundColor(Color("text"))
                        .opacity(0.65)
                        .shadow(color: .white.opacity(0.19), radius: 2, x: 0, y: 0)
                        .shadow(color: .white.opacity(0.25), radius: 4, x: 0, y: 2)
                    
                    RoundedRectangle(cornerRadius: 80)
                        .fill((Color.clear)
                            .shadow(.inner(color: tap ? .black.opacity(0.1) : .white.opacity(0.25), radius: tap ? 8 : 4, x: 0, y: 6))
                            .shadow(.inner(color: tap ? .black.opacity(0.1) : .white.opacity(0.3), radius: tap ? 8 : 2, x: 0, y: tap ? -2 : -1))
                        )
                        .frame(width: 300, height: 100)
                        .shadow(color: tap ? .white.opacity(0.25) : .black.opacity(0.2), radius: tap ? 9 : 8, x: 0, y: tap ? 3 : 12)
                        .shadow(color: tap ? .white.opacity(0.25) : .black.opacity(0.1), radius: tap ? 10 : 32, x: 0, y: tap ? -4 : 6)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

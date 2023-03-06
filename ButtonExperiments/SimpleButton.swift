//
//  SimpleButton.swift
//  ButtonExperiments
//
//  Created by Nick Rice on 04/03/2023.
//

import SwiftUI

struct SimpleButton: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SimpleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 120)
            .padding(.vertical, 38)
            .background(
                Group {
                    if configuration.isPressed {
                        RoundedRectangle(cornerRadius: 80)
                            .fill((Color("background"))
                                .shadow(.inner(color: .black.opacity(0.20), radius: 8, x: 0, y: 3))
                                .shadow(.inner(color: .black.opacity(0.1), radius: 8, x: 0, y: -2))
                            )
                            .shadow(color: .white.opacity(0.25), radius: 9, x: 0, y: 3)
                            .shadow(color: .white.opacity(0.25), radius: 10, x: 0, y: -4)
                            .scaleEffect(
                                withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                                    0.95
                                }
                            )
                        
                    } else {
                        RoundedRectangle(cornerRadius: 80)
                            .fill((Color("background"))
                                .shadow(.inner(color: .white.opacity(0.25), radius: 4, x: 0, y: 8))
                                .shadow(.inner(color: .white.opacity(0.3), radius: 2, x: 0, y: -2))
                            )
                            .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 12)
                            .shadow(color: .black.opacity(0.1), radius: 32, x: 0, y: 6)
                            .scaleEffect(
                                withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                                    1
                                }
                            )
                    }
                }
            )
    }
}

struct SimpleButton_Previews: PreviewProvider {
    static var previews: some View {
        SimpleButton()
    }
}

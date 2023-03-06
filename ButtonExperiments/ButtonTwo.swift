//
//  ButtonTwo.swift
//  ButtonExperiments
//
//  Created by Nick Rice on 06/03/2023.
//

import SwiftUI

struct ButtonTwo: View {
    @State private var tap2 = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 80)
                .fill((Color("background"))
                    .shadow(.inner(color: tap2 ? .black.opacity(0.1) : .white.opacity(0.25), radius: tap2 ? 8 : 4, x: 0, y: 6))
                    .shadow(.inner(color: tap2 ? .black.opacity(0.1) : .white.opacity(0.3), radius: tap2 ? 8 : 2, x: 0, y: tap2 ? -2 : -1))
                )
                .frame(width: 300, height: 100)
                .shadow(color: tap2 ? .white.opacity(0.25) : .black.opacity(0.2), radius: tap2 ? 9 : 8, x: 0, y: tap2 ? 3 : 12)
                .shadow(color: tap2 ? .white.opacity(0.25) : .black.opacity(0.1), radius: tap2 ? 10 : 32, x: 0, y: tap2 ? -4 : 6)
            
            Text("Button 2")
                .font(.system(.title, weight: .semibold))
                .foregroundColor(Color("text"))
        }
        .onTapGesture {
            tap2 = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                tap2 = false
            }
        }
        .scaleEffect(tap2 ? 0.95 : 1)
        .animation(.spring(response: 0.4, dampingFraction: 0.6))
    }
}

struct ButtonTwo_Previews: PreviewProvider {
    static var previews: some View {
        ButtonTwo()
    }
}

//
//  ToggleAction.swift
//  LiquidGlassEx
//
//  Created by Michael Sharman on 12/24/25.
//

import SwiftUI

struct ToggleAction: View {
    
    @State private var toggleOn: Bool = false
    
    var body: some View {
        VStack {
            /// The toggle receives the Liquid Glass treatment automatically
            Toggle("Lights", systemImage: toggleOn ? "lightbulb.fill" : "lightbulb", isOn: $toggleOn)
        }
        /// The tint is applied to the toggle
        .tint(Color.yellow)
        .padding()
    }
}

#Preview {
    ToggleAction()
}

import SwiftUI

struct HScrollViewButtons: View {
    
    let textButtons: [String] = ["Hello", "World", "SwiftUI", "Is", "Awesome"]
    
    let backgroundText: String = "The quick brown fox jumps over the lazy dog."
    
    var body: some View {
        ZStack {
            
            /// Here is a ScrollView of text to demonstrate the content layers and the reaction from Liquid Glass to transitions
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(1..<100) { _ in
                        Text("\(backgroundText)")
                    }
                }
                .padding(.leading)
            }
            
            VStack {
                Spacer()
                
                if #available(iOS 26.0, *) {
                    /// GlassEffectContainer ensures all buttons are treated as one group of elements so that each time the buttons interact they appear to join at the tips like drops of liquid
                    /// GlassEffectContainer also ensures better rendering performance and stability
                    GlassEffectContainer {
                        scrollViewContent
                    }
                    /// This background modifier is used to apply a gentle blur over text passing underneath the GlassEffectContainer so that the buttons are visually separated from the content
                    .background {
                        Color(.systemBackground).opacity(0.5)
                            .blur(radius: 20)
                            .padding(.bottom)
                            .ignoresSafeArea()
                    }
                } else {
                    scrollViewContent
                }
                
            }
            
        }
    }
    
    private var scrollViewContent: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(textButtons, id: \.self) { text in
                    Button(action: {
                        print(text)
                    }) {
                        Text(text)
                            .font(.callout)
                            .foregroundStyle(Color.blue)
                            .padding(.horizontal, 5)
                            .padding(.vertical, 3)
                    }
                    .conditionalGlassButtonModifier()
                }
            }
            .padding(.horizontal, 10)
        }
    }
}

extension View {
    /// Conditionally applies button modifiers (border shape and glass style)
    @ViewBuilder
    func conditionalGlassButtonModifier() -> some View {
        if #available(iOS 26.0, *) {
            self
                .buttonStyle(.glass)
        } else {
            self
        }
    }
}

#Preview {
    HScrollViewButtons()
}

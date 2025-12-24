
import SwiftUI

struct LegacyButtonSupport: View {
    
    private let title: String = "Hello, World!"
    
    var body: some View {
        VStack {
            
            /// Use this if statement to provide backwards compatibility
            if #available(iOS 26.0, *) {
                /// Instead of a rounded rectangle bordered buttons now use a pill shape
                button(title, { print(title) })
                .buttonStyle(.glass)
            } else {
                button(title, { print(title) })
                .buttonStyle(.bordered)
            }
        }
    }
    
    /// Helful method to handle button design
    private func button(_ title: String, _ action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            Text(title)
            /// Note that the Liquid Glass buttons are often larger than the legacy buttons so the padding number may also need to be adjusted per iOS version
                .padding(10)
        }
    }
}

#Preview {
    LegacyButtonSupport()
}

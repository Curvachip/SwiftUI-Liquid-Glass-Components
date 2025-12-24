
import SwiftUI

struct FloatingTextfieldAndButton: View {
    
    @State private var text: String = ""
    
    let profileNames: [String] = ["John", "Jane", "Alice", "Bob", "Charlie"]
    
    var body: some View {
        
        /// Notice how these large black rectangles passing beneath the toolbar cause the Liquid Glass controls to momentarily change to Dark Mode to improve visibility
        ScrollView {
            LazyVStack {
                ForEach(profileNames, id: \.self) { name in
                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: 150)
                        Text(name)
                            .font(.title)
                            .foregroundStyle(Color.white)
                            .padding()
                    }
                    .padding()
                }
            }
        }
        
        /// Here are the Liquid Glass elements
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                    TextField("Ask anything...", text: $text)
                        .padding(10)
                
                /// All we need is a Spacer to create a visual break between elements
                Spacer()
                
                if #available(iOS 26.0, *) {
                    toolbarButton()
                        .buttonStyle(.glassProminent)
                } else {
                    toolbarButton()
                        .buttonStyle(.borderedProminent)
                }
            }
        }
    }
    
    func toolbarButton() -> some View {
        Button(action: {
            print("send")
        }) {
            Image(systemName: "arrow.up")
        }
        .tint(.blue)
    }
}

#Preview {
    FloatingTextfieldAndButton()
}

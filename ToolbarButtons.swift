
import SwiftUI

// MARK: - ToolbarButtons
struct ToolbarButtons: View {
    
    var body: some View {
        
        if #available(iOS 18.0, *) {
            /// TabViews automatically inherit the new floating Liquid Glass design
            TabView {
                Tab("Home", systemImage: "house") {
                    HomeView()
                }
                Tab("Lists", systemImage: "list.bullet") {
                    ListView()
                }
            }
        } else {
            TabView {
                HomeView()
                    .tabItem {
                        VStack {
                            Image(systemName: "house")
                            Text("Home")
                        }
                    }
            }
            TabView {
                ListView()
                    .tabItem {
                        VStack {
                            Image(systemName: "list.bullet")
                            Text("Lists")
                        }
                    }
            }
        }
    }
    
    // MARK: - HomeView
    struct HomeView: View {
        var body: some View {
            NavigationStack {
                VStack {
                    Text("Home")
                }
                /// Toolbars receive the Liquid Glass style automatically
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            print("profile")
                        } label: {
                            Image(systemName: "person.fill")
                        }
                        .conditionalProminentGlassButtonModifier()
                        .tint(Color.blue)
                    }
                }
            }
        }
    }
    
    // MARK: - ListsView
    struct ListView: View {
        
        let listItems: [String] = ["One", "Two", "Three"]
        
        var body: some View {
            NavigationStack {
                List {
                    ForEach(listItems, id: \.self) { item in
                        
                        /// When navigating to each list item the Liquid Glass buttons morph and bounce during the transition
                        NavigationLink(destination: {
                            ListSubView(text: item)
                        }, label: {
                            Text(item)
                        })
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            print("add")
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - ListSubView
    struct ListSubView: View {
        
        var text: String
        
        @Environment(\.displayScale) var displayScale
        
        @State private var isStarred: Bool = false
        
        @State private var renderedImage = Image(systemName: "photo")
        
        let settingsOptions: [String] = ["Option 1", "Option 2", "Option 3"]
        
        @State private var settingsState: [String: Bool] = [:]
        
        var body: some View {
            NavigationStack {
                Text(text)
            }
            .onAppear {
                if settingsState.isEmpty {
                    var initial: [String: Bool] = [:]
                    for option in settingsOptions {
                        initial[option] = false
                    }
                    settingsState = initial
                }
                render()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isStarred.toggle()
                    } label: {
                        Image(systemName: isStarred ? "star.fill" : "star")
                    }
                }
                
                if #available(iOS 26.0, *) {
                    
                    /// The ToolbarSpacer provides a break between items while allowing the Liquid Glass buttons to continue interacting with each other when pressed
                    ToolbarSpacer(.flexible, placement: .topBarTrailing)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    ShareLink(item: renderedImage, preview: SharePreview(Text("Check out this card!"), image: renderedImage))
                }
                ToolbarItem(placement: .topBarTrailing) {
                    
                    /// The menu options morph smoothly into and out of the gear icon
                    Menu("Settings", systemImage: "gear") {
                        ForEach(settingsOptions, id: \.self) { option in
                            // create a Binding to the Bool in settingsState for this option
                            let binding = Binding<Bool>(
                                get: { settingsState[option] ?? false },
                                set: { settingsState[option] = $0 }
                            )
                            Toggle(option, isOn: binding)
                        }
                    }
                    .menuIndicator(.hidden)
                }
            }
        }
        
        var styledViewSnapshot: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .foregroundStyle(Color.blue)
                    .frame(width: 100, height: 75)
                Text(text)
            }
        }
        
        @MainActor func render() {
            let renderer = ImageRenderer(content: styledViewSnapshot)
            
            /// make sure and use the correct display scale for this device
            renderer.scale = displayScale
            
            if let uiImage = renderer.uiImage {
                renderedImage = Image(uiImage: uiImage)
            }
        }
        
        
    }
}

extension View {
    /// Conditionally applies button modifiers (border shape and glass style)
    @ViewBuilder
    func conditionalProminentGlassButtonModifier() -> some View {
        if #available(iOS 26.0, *) {
            self
                .buttonStyle(.glassProminent)
        } else {
            self
        }
    }
}
    
#Preview {
    ToolbarButtons()
}

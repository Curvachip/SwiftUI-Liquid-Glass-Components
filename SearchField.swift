
import SwiftUI

struct SearchField: View {
    
    @State private var search: String = ""
        
    var body: some View {
        NavigationStack {
            List {
                if filteredItems.isEmpty {
                    /// Show helpful text when there are no matches
                    Text("No results")
                        .foregroundStyle(.secondary)
                } else {
                    ForEach(filteredItems, id: \.self) { item in
                        Text(item)
                    }
                }
            }
            .navigationTitle("Search Example")
        }
        /// In iOS 26 this modifier automatically adapts the new search field behavior and placement at the bottom of the view
        .searchable(text: $search, placement: .automatic, prompt: "Search fruits & items")
    }
    
    /// Example text to search through
    private let sampleItems: [String] = [
        "Apple",
        "Banana",
        "Cherry",
        "Date",
        "Elderberry",
        "Fig",
        "Grape",
        "Honeydew",
        "Iceberg Lettuce",
        "Jackfruit",
        "Kiwi",
        "Lemon",
        "Mango",
        "Nectarine",
        "Orange",
        "Papaya",
        "Quince",
        "Raspberry",
        "Strawberry",
        "Tomato",
        "Ugli Fruit",
        "Vanilla Bean",
        "Watermelon",
        "Xigua",
        "Yellow Passion Fruit",
        "Zucchini"
    ]
    
    /// Filtered results based on search text (case-insensitive)
    private var filteredItems: [String] {
        let trimmed = search.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return sampleItems }
        return sampleItems.filter { $0.range(of: trimmed, options: .caseInsensitive) != nil }
    }

}

#Preview {
    SearchField()
}

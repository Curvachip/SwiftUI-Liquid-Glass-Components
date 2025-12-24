# SwiftUI-Liquid-Glass-Components
Quickly implement and test new Liquid Glass user interface elements in SwiftUI and handle backwards compatibility with conditional logic and device OS version checks.

## Features
- Liquid Glass-style UI components for SwiftUI
- Self-contained files (no inter-file dependencies)
- Backward compatibility helpers (graceful fallbacks for older OS versions)
- Components for
  - Buttons
  - Text fields
  - Toolbars
  - Tab bars
  - Custom glass materials
  - Lists & forms
  - Search fields
  - View transitions
  - Menus
- Designed for SwiftUI and modern Apple Platforms

## Getting Started
- Clone this repo: ```git clone https://github.com/DesignPro23/SwiftUI-Liquid-Glass-Components.git```
- Select the files you want and drag them into your SwiftUI project
- Make sure you handle availability checks if you’re targeting pre-iOS26:
```
if #available(iOS 26.0, *) {
    // use Liquid Glass
} else {
    // fallback UI
}
```
- Please email developer@curvachip.com with any questions, concerns, or suggestions

## Built With
- Swift and SwiftUI
- Supports iOS and iPadOS 17.6 or later
- Xcode version 26.2 and macOS 26.2

## Resources
- Explore Liquid Glass: https://developer.apple.com/design/?cid=ht-new-design-g-l-2
- Adopting Liquid Glass: https://developer.apple.com/documentation/TechnologyOverviews/adopting-liquid-glass
- Applying Liquid Glass to Custom Views: https://developer.apple.com/documentation/SwiftUI/Applying-Liquid-Glass-to-custom-views
- Apple Human Interface Guidelines (updated): https://developer.apple.com/design/human-interface-guidelines/
- Figma App Icon template: https://www.figma.com/community/file/1514335373494164156/app-icon-template
- Sketch App Icon template: https://www.sketch.com/s/0ee52d20-8daf-49ef-b335-14020af3b060

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you'd like to change.

## License
MIT License. See `LICENSE` file for details.

## Author
- DesignPro23 through Curvachip LLC in 2025

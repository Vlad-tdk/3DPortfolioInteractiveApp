# AR Visualizer 🥽

A cutting-edge iOS application that demonstrates advanced Augmented Reality capabilities using ARKit and RealityKit. Place, manipulate, and interact with 3D models in real-world environments with intuitive gestures and professional-grade AR features.

![iOS](https://img.shields.io/badge/iOS-15.0+-blue.svg)
![Swift](https://img.shields.io/badge/Swift-5.7+-orange.svg)
![ARKit](https://img.shields.io/badge/ARKit-6.0+-green.svg)
![RealityKit](https://img.shields.io/badge/RealityKit-3.0+-purple.svg)
![SwiftUI](https://img.shields.io/badge/SwiftUI-4.0+-red.svg)

## ✨ Features

### 🎯 Core AR Functionality
- **Real-time Surface Detection** - Horizontal and vertical plane detection
- **Gesture-based Interaction** - Tap to place, pinch to scale, rotate models
- **Advanced Tracking** - World tracking with environmental understanding
- **Scene Reconstruction** - Mesh-based scene understanding (on supported devices)
- **Realistic Lighting** - Environment-based lighting and shadows

### 🎨 3D Models & Categories
- **Furniture** - Chairs, tables, and home decorations
- **Electronics** - Laptops, gadgets, and tech devices
- **Vehicles** - Cars, motorcycles, and transportation
- **Architecture** - Buildings, structures, and landmarks
- **Decorations** - Animated stars, ornaments, and art pieces

### 🛠 Advanced Controls
- **Model Editing** - Scale, rotate, and position adjustments
- **Lighting Control** - Adjustable environment lighting intensity
- **Occlusion Support** - People and object occlusion (iOS 13+)
- **Statistics Overlay** - Real-time performance metrics
- **Session Management** - Pause, resume, and reset AR sessions

### 🎭 Modern UI/UX
- **Glassmorphism Design** - Beautiful translucent interface elements
- **Smooth Animations** - Fluid transitions and micro-interactions
- **Adaptive Layout** - Responsive design for all device sizes
- **Dark Mode** - Optimized for AR viewing conditions

## 🏗 Architecture

### Design Patterns
- **MVVM Architecture** - Clean separation of concerns
- **ObservableObject Pattern** - Reactive state management
- **Dependency Injection** - Testable and modular components
- **Protocol-Oriented Programming** - Flexible and extensible design

### Technologies Used
- **SwiftUI** - Modern declarative UI framework
- **ARKit** - Apple's augmented reality framework
- **RealityKit** - High-performance 3D rendering engine
- **Combine** - Reactive programming framework
- **Swift Concurrency** - Modern async/await patterns

## 📋 Requirements

### System Requirements
- **iOS 15.0+** - Latest SwiftUI and ARKit features
- **Xcode 14.0+** - Swift 5.7 and iOS 16 SDK
- **A12 Bionic chip or later** - Required for ARKit performance
- **TrueDepth camera** (recommended) - Enhanced AR capabilities

### Device Compatibility
| Device | ARKit Support | Performance |
|--------|---------------|-------------|
| iPhone 12 Pro/Pro Max | ✅ Full | Excellent |
| iPhone 13/14 Series | ✅ Full | Excellent |
| iPhone 11 Pro/Pro Max | ✅ Full | Very Good |
| iPhone XS/XR | ✅ Basic | Good |
| iPad Pro (3rd gen+) | ✅ Full | Excellent |

## 🚀 Installation

### Prerequisites
1. **Apple Developer Account** (for device testing)
2. **Xcode 14.0+** installed
3. **iOS device** with ARKit support
4. **macOS 12.0+** (for Xcode compatibility)

### Setup Steps

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/ar-visualizer.git
cd ar-visualizer
```

2. **Open in Xcode**
```bash
open ARVisualizer.xcodeproj
```

3. **Configure signing**
   - Select your development team
   - Update bundle identifier
   - Enable automatic signing

4. **Add camera permissions**
   
   Add to `Info.plist`:
```xml
<key>NSCameraUsageDescription</key>
<string>Camera access is required for AR functionality</string>
```

5. **Build and run**
   - Select your iOS device (Simulator not supported for AR)
   - Press ⌘R to build and run

## 🎮 Usage Guide

### Getting Started
1. **Grant camera permission** when prompted
2. **Point device at a flat surface** (table, floor, wall)
3. **Wait for surface detection** (look for visual indicators)
4. **Tap "Add Model"** to open the model library

### Basic Controls
- **Tap to Place** - Touch detected surface to place selected model
- **Pinch to Scale** - Use two fingers to resize models
- **Rotate with Two Fingers** - Twist gesture to rotate objects
- **Drag to Move** - Touch and drag to reposition models

### Advanced Features
- **Model Categories** - Filter by furniture, electronics, etc.
- **Editing Mode** - Fine-tune position, scale, and rotation
- **Statistics View** - Monitor FPS and tracking quality
- **Session Controls** - Pause/resume AR for battery savings

## 🎯 Key Implementation Details

### AR Session Management
```swift
@MainActor
class ARSessionManager: NSObject, ObservableObject {
    @Published var sessionState: ARSessionState = .notStarted
    @Published var placedModels: [PlacedModel] = []
    
    func setupARView(_ arView: ARView) {
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal, .vertical]
        configuration.environmentTexturing = .automatic
        arView.session.run(configuration)
    }
}
```

### Procedural 3D Model Generation
```swift
private func createChair() -> ModelEntity {
    let seat = ModelEntity(mesh: .generateBox(size: SIMD3<Float>(0.5, 0.05, 0.5)))
    seat.model?.materials = [SimpleMaterial(color: .brown, isMetallic: false)]
    
    // Add backrest, legs, etc.
    return seat
}
```

### Gesture Recognition
```swift
@objc private func handleTap(_ gesture: UITapGestureRecognizer) {
    let location = gesture.location(in: arView)
    let raycastQuery = arView.makeRaycastQuery(from: location, allowing: .estimatedPlane, alignment: .any)
    
    if let firstResult = arView.session.raycast(raycastQuery).first {
        Task {
            await placeModel(selectedModel, at: firstResult.worldTransform)
        }
    }
}
```

## 🔧 Configuration Options

### Performance Settings
```swift
struct ARConstants {
    static let maxModelsPerScene = 20
    static let targetFrameRate = 60
    static let maxRaycastDistance: Float = 10.0
    static let modelScale: Float = 0.1
}
```

### Lighting Configuration
```swift
// Adjust environment lighting
arView.environment.lighting.intensityExponent = 1.5
configuration.environmentTexturing = .automatic
```

## 🐛 Troubleshooting

### Common Issues

**AR Session Won't Start**
- Ensure camera permissions are granted
- Check device compatibility (A12+ chip required)
- Verify adequate lighting conditions

**Poor Tracking Quality**
- Move device slowly and steadily
- Point at textured surfaces (avoid plain walls)
- Ensure good lighting (avoid direct sunlight)

**Models Not Placing**
- Look for detected planes (yellow overlays)
- Tap directly on detected surfaces
- Wait for tracking to stabilize

**Performance Issues**
- Reduce number of placed models
- Lower lighting quality in settings
- Restart AR session periodically

### Debug Features
- **Statistics Overlay** - Monitor real-time performance
- **Plane Visualization** - See detected surfaces
- **Console Logging** - Detailed AR session events

## 📈 Performance Optimization

### Best Practices
- **Limit concurrent models** - Maximum 15-20 for optimal performance
- **Use LOD models** - Lower detail for distant objects
- **Optimize textures** - Compress textures for mobile
- **Manage memory** - Remove off-screen models

### Monitoring
- **Frame rate tracking** - Target 60 FPS consistently
- **Memory usage** - Monitor with Xcode Instruments
- **Battery impact** - Optimize for extended AR sessions

## 🤝 Contributing

### Development Guidelines
1. **Follow Swift style guide** - SwiftLint configuration included
2. **Write unit tests** - Maintain >80% code coverage
3. **Document public APIs** - Use Swift DocC format
4. **Performance first** - Profile before optimizing

### Pull Request Process
1. Fork the repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Apple ARKit Team** - For the incredible AR framework
- **RealityKit Engineers** - For high-performance 3D rendering
- **Swift Community** - For modern language features
- **Design Inspiration** - Material Design and Human Interface Guidelines

## 📞 Support

### Community
- **GitHub Issues** - Bug reports and feature requests
- **Stack Overflow** - Technical questions with `arkit` tag
- **Apple Developer Forums** - ARKit-specific discussions

### Documentation
- [ARKit Documentation](https://developer.apple.com/documentation/arkit)
- [RealityKit Documentation](https://developer.apple.com/documentation/realitykit)
- [SwiftUI Documentation](https://developer.apple.com/documentation/swiftui)

---

**Made with ❤️ for the iOS AR community**

*Showcasing the future of mobile augmented reality experiences*

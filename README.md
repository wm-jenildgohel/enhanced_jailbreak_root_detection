# 🎉 enhanced_jailbreak_root_detection 🎉

[![pub package](https://img.shields.io/pub/v/enhanced_jailbreak_root_detection.svg)](https://pub.dartlang.org/packages/enhanced_jailbreak_root_detection)

**Why this package is awesome?**
- 🚀 Super‑charged root & jailbreak detection for Android & iOS.
- 🛡️ Combines RootBeer, Frida detection and IOSSecuritySuite for rock‑solid security.
- 📱 Works perfectly on real devices – no false alarms on emulators!
- 🎯 Supports Android 16KB page size out of the box.

## 😎 Quick Start
Add the dependency to your `pubspec.yaml`:
```yaml
dependencies:
  enhanced_jailbreak_root_detection: ^0.0.2
```
Or pull straight from GitHub:
```yaml
dependencies:
  enhanced_jailbreak_root_detection:
    git:
      url: https://github.com/wm-jenildgohel/enhanced_jailbreak_root_detection.git
      ref: main
```

## 📦 Usage
```dart
final detection = EnhancedJailbreakRootDetection.instance;
final isJailBroken = await detection.isJailBroken;
final isRooted = await detection.isNotTrust; // Android specific
final isRealDevice = await detection.isRealDevice;
```
> **Important:** Test on a **real device** for accurate results!

## 📚 More Info
- Android 16KB page size support: see `android/README.md`.
- iOS: add the required schemes to `Info.plist`:
```xml
<key>LSApplicationQueriesSchemes</key>
<array>
  <string>undecimus</string>
  <string>sileo</string>
  <string>zbra</string>
  <string>filza</string>
  <string>activator</string>
  <string>cydia</string>
</array>
```

## 🤝 Contributing
We love contributions! Open an issue or submit a PR.

## 📄 License
Same license as the original `jailbreak_root_detection` package.

---

*This README was refreshed to be more welcoming and fun. 🎈*

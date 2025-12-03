# enhanced_jailbreak_root_detection

[![pub package](https://img.shields.io/pub/v/enhanced_jailbreak_root_detection.svg)](https://pub.dartlang.org/packages/enhanced_jailbreak_root_detection)

A comprehensive Flutter plugin for detecting jailbroken/rooted devices with advanced security checks.

## About

This package is an enhanced fork of [jailbreak_root_detection](https://github.com/w3connext/jailbreak_root_detection), originally created by [W3Connext](https://github.com/w3connext). It provides robust security detection mechanisms for both Android and iOS platforms.

### Key Features

- **Android**: Utilizes [RootBeer](https://github.com/scottyab/rootbeer) for comprehensive root detection + custom Frida detection to identify debugging/instrumentation frameworks
- **iOS**: Implements [IOSSecuritySuite (~> 1.9.10)](https://github.com/securing/IOSSecuritySuite/tree/1.9.10) for jailbreak detection and tampering checks
- **16KB Page Size Support**: Fully compatible with Android's 16KB page size requirements
- **Real Device Testing**: Optimized for production environments with accurate detection on physical devices

### Credits

- Original package: [jailbreak_root_detection](https://github.com/w3connext/jailbreak_root_detection) by W3Connext
- Inspired by: [trust_fall](https://github.com/anish-adm/trust_fall)

## Getting started

In your flutter project add the dependency:

```yaml
dependencies:
  enhanced_jailbreak_root_detection: ^0.0.2
```

Or use it directly from GitHub:

```yaml
dependencies:
  enhanced_jailbreak_root_detection:
    git:
      url: https://github.com/wm-jenildgohel/enhanced_jailbreak_root_detection.git
      ref: main
```

## Usage

### Important: Test on Real Devices Only

This package must be tested on a real device (physical device).

Running on an emulator or simulator may cause false positives — for example, the detection may incorrectly report that the device is jailbroken or rooted.

### Android

#### 16KB Page Size Support

For information on 16KB page size support on Android, please see the `android/README.md` file.

```dart
final isNotTrust = await EnhancedJailbreakRootDetection.instance.isNotTrust;
final isJailBroken = await EnhancedJailbreakRootDetection.instance.isJailBroken;
final isRealDevice = await EnhancedJailbreakRootDetection.instance.isRealDevice;
final isOnExternalStorage = await EnhancedJailbreakRootDetection.instance.isOnExternalStorage;
final checkForIssues = await EnhancedJailbreakRootDetection.instance.checkForIssues;
final isDevMode = await EnhancedJailbreakRootDetection.instance.isDevMode;
```

### iOS

- Update `Info.plist`

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

```dart
final isNotTrust = await EnhancedJailbreakRootDetection.instance.isNotTrust;
final isJailBroken = await EnhancedJailbreakRootDetection.instance.isJailBroken;
final isRealDevice = await EnhancedJailbreakRootDetection.instance.isRealDevice;
final checkForIssues = await EnhancedJailbreakRootDetection.instance.checkForIssues;

final bundleId = 'my-bundle-id'; // Ex: final bundleId = 'com.w3conext.enhancedJailbreakRootDetectionExample'
final isTampered = await EnhancedJailbreakRootDetection.instance.isTampered(bundleId);
```

## Contributing

Contributions are welcome! If you find a bug or want to add a feature, please open an issue or submit a pull request.

## License

This project maintains the same license as the original [jailbreak_root_detection](https://github.com/w3connext/jailbreak_root_detection) package.

## References

- [Original Package: jailbreak_root_detection](https://github.com/w3connext/jailbreak_root_detection)
- [trust_fall](https://github.com/anish-adm/trust_fall)
- [RootBeer](https://github.com/scottyab/rootbeer)
- [IOSSecuritySuite](https://github.com/securing/IOSSecuritySuite)

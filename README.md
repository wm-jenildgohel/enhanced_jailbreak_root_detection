# enhanced_jailbreak_root_detection

[![pub package](https://img.shields.io/pub/v/enhanced_jailbreak_root_detection.svg)](https://pub.dartlang.org/packages/enhanced_jailbreak_root_detection)

Uses [RootBeer](https://github.com/scottyab/rootbeer) + DetectFrida for Android root detection and [IOSSecuritySuite (~> 1.9.10)](https://github.com/securing/IOSSecuritySuite/tree/1.9.10) for iOS jailbreak detection.

## Getting started

In your flutter project add the dependency:

```yaml
enhanced_jailbreak_root_detection: "^1.2.0+1"
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

### Reference

- https://github.com/anish-adm/trust_fall

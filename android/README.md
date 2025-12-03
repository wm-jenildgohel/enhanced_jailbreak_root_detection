# Android 16KB Page Size Support

This project is compatible with 16KB page sizes on Android. This is achieved by using the `useLegacyPackaging` option in the `android/build.gradle` file:

```groovy
// For AGP 8.3.0: Use compressed libraries to ensure proper packaging
// for 16KB page size support
packagingOptions {
    jniLibs {
        useLegacyPackaging true
    }
}
```

This setting ensures that the native libraries are properly packaged and aligned for devices with 16KB page sizes.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:enhanced_jailbreak_root_detection/enhanced_jailbreak_root_detection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _result = '';

  @override
  void initState() {
    super.initState();
    _processCheckJailbreakRoot();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(_result),
              ElevatedButton(
                onPressed: _processCheckJailbreakRoot,
                child: const Text('Check'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _processCheckJailbreakRoot() async {
    _result = '';
    final isNotTrust = await EnhancedJailbreakRootDetection.instance.isNotTrust;
    final isRealDevice = await EnhancedJailbreakRootDetection.instance.isRealDevice;
    print('isNotTrust: $isNotTrust');
    print('isRealDevice: $isRealDevice');
    _result += 'isNotTrust: $isNotTrust\n';
    _result += 'isRealDevice: $isRealDevice\n';
    if (Platform.isAndroid) {
      try {
        bool isOnExternalStorage =
            await EnhancedJailbreakRootDetection.instance.isOnExternalStorage;
        print('isOnExternalStorage: $isOnExternalStorage');
        _result += 'isOnExternalStorage: $isOnExternalStorage\n';
      } catch (e) {
        print(e);
      }
    }
    if (Platform.isIOS) {
      const bundleId = 'com.w3conext.jailbreakRootDetectionExample';
      final isTampered =
          await EnhancedJailbreakRootDetection.instance.isTampered(bundleId);
      print('isTampered: $isTampered');
      _result += 'isTampered: $isTampered\n';
    }

    final checkForIssues = await EnhancedJailbreakRootDetection.instance.checkForIssues;
    print('checkForIssues: $checkForIssues');
    for (final issue in checkForIssues) {
      print('issue: ${issue.toString()}');
      _result += '$issue\n';
    }

    setState(() {});
  }
}

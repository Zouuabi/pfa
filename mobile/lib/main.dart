import 'package:flutter/material.dart';
import 'package:mobile/presentation/app.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      backgroundColor: Colors.teal,
      isToolbarVisible: false,
      builder: (context) => const MyApp(),
    ),
  );
}

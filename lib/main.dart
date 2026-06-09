import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const ZeroERPApp());
}

class ZeroERPApp extends StatelessWidget {
  const ZeroERPApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
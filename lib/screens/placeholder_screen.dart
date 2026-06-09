// ignore_for_file: empty_statements

import 'package:flutter/material.dart';

class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.account_circle,
                    size: 28,
                    color: Colors.black,
                  ),

                  const Text(
                    'Summary',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),

                  const SizedBox(width: 28),
                ],
              ),

              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.construction_outlined,
                        size: 70,
                        color: Colors.black26,
                      ),

                      SizedBox(height: 20),

                      Text(
                        '$title Coming Soon',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox(height: 8),

                      Text(
                        'This feature is currently under development.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // ignore: dead_code
      ),
    );
  }
}

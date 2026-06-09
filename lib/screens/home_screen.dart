import 'package:flutter/material.dart';
import 'package:flutter_erp/data/dummy_data.dart';
import 'package:flutter_erp/widgets/menu_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        // Leave bottom padding handled by the parent scaffold/bottom nav
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 20),

                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.25),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.4),
                        ),
                      ),
                      child: const Icon(
                        Icons.account_circle,
                        size: 22,
                        color: Colors.black87,
                      ),
                    ),

                    const Text(
                      'ZeroERP',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.25),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.4),
                        ),
                      ),
                      child: const Icon(
                        Icons.send_outlined,
                        size: 22,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                const Text(
                  'Welcome Back Admin !',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                const SizedBox(height: 42),

                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: menuItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 28,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    return MenuCard(
                      icon: menuItems[index]['icon'] as IconData,
                      title: menuItems[index]['title'] as String,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
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
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 37,
                      height: 37,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withValues(alpha: 0.45),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.8),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.03),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: HeroIcon(
                        HeroIcons.userCircle,
                        size: 30,
                        color: Colors.black87,
                      ),
                    ),

                    Text(
                      'ZeroERP',
                      style: TextStyle(
                        fontFamily: 'Neue Montreal',
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                        height: 1.0,
                        letterSpacing: 0.0,
                        color: Colors.grey[800],
                      ),
                    ),

                    Container(
                      width: 37,
                      height: 37,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withValues(alpha: 0.45),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.8),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.03),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: HeroIcon(
                        HeroIcons.paperAirplane,
                        size: 20,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                const Text(
                  'Welcome Back Admin !',
                  style: TextStyle(
                    fontFamily: 'Neue Montreal',
                    fontSize: 18,
                    color: Colors.black54,
                    fontWeight: FontWeight.w300,
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
  icon: menuItems[index]['icon'] as HeroIcons,
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

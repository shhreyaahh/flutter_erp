import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  static const double _navHeight = 62;
  static const double _innerPadding = 6;
  static const double _selectedHeight = _navHeight - (_innerPadding * 2);
  static const Color _accentColor = Color(0xFFFFA988);
  static const Color _selectedColor = Color(0xFFF4C3B3);

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  Widget _navItem({
    required HeroIcons icon,
    required String label,
    required bool selected,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        width: double.infinity,
        height: _selectedHeight,
        decoration: BoxDecoration(
          color: selected ? _selectedColor : Colors.transparent,
          borderRadius: BorderRadius.circular(_selectedHeight / 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeroIcon(
              icon,
              style: HeroIconStyle.outline,
              size: selected ? 24 : 22,
              color: selected ? Colors.white : Colors.black,
            ),

            const SizedBox(height: 0),

            Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: selected ? 11 : 10,
                fontWeight: FontWeight.w500,
                color: selected ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: _navHeight,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.96),
                  borderRadius: BorderRadius.circular(_navHeight / 2),
                  border: Border.all(color: _accentColor, width: 1.4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.10),
                      blurRadius: 28,
                      spreadRadius: 0,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Padding(
                      padding: const EdgeInsets.all(_innerPadding),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: _navItem(
                              icon: HeroIcons.home,
                              label: "Home",
                              selected: currentIndex == 0,
                              onPressed: () => onTap(0),
                            ),
                          ),

                          const SizedBox(width: 8),

                          Expanded(
                            flex: 1,
                            child: _navItem(
                              icon: HeroIcons.chartBar,
                              label: "Summary",
                              selected: currentIndex == 1,
                              onPressed: () => onTap(1),
                            ),
                          ),

                          const SizedBox(width: 8),

                          Expanded(
                            flex: 1,
                            child: _navItem(
                              icon: HeroIcons.megaphone,
                              label: "Notices",
                              selected: currentIndex == 2,
                              onPressed: () => onTap(2),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(width: 12),

            Container(
              width: _navHeight,
              height: _navHeight,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.96),
                shape: BoxShape.circle,
                border: Border.all(color: _accentColor, width: 1.4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.10),
                    blurRadius: 28,
                    spreadRadius: 0,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: HeroIcon(
                HeroIcons.magnifyingGlass,
                style: HeroIconStyle.outline,
                size: 24,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  static const double _navHeight = 74;
  static const double _innerPadding = 8;
  static const double _selectedHeight = _navHeight - (_innerPadding * 2);
  static const Color _accentColor = Color(0xFFFFA988);
  static const Color _selectedColor = Color(0xFFF4C3B3);

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  Widget _navItem({
    required IconData icon,
    required String label,
    required bool selected,
    required VoidCallback onPressed,
    required double width,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        width: width,
        height: _selectedHeight,
        decoration: BoxDecoration(
          color: selected ? _selectedColor : Colors.transparent,
          borderRadius: BorderRadius.circular(_selectedHeight / 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: selected ? 27 : 25,
              color: selected ? Colors.white : Colors.black,
            ),

            const SizedBox(height: 0),

            Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: selected ? 15 : 14,
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
                    final availableWidth =
                        constraints.maxWidth - (_innerPadding * 2);
                    final selectedWidth = availableWidth >= 300
                        ? (availableWidth * 0.34).clamp(112.0, 148.0)
                        : availableWidth * 0.38;
                    final normalWidth = (availableWidth - selectedWidth) / 2;

                    return Padding(
                      padding: const EdgeInsets.all(_innerPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _navItem(
                            icon: Icons.home,
                            label: "Home",
                            selected: currentIndex == 0,
                            width: currentIndex == 0
                                ? selectedWidth
                                : normalWidth,
                            onPressed: () => onTap(0),
                          ),

                          _navItem(
                            icon: Icons.bar_chart_rounded,
                            label: "Summary",
                            selected: currentIndex == 1,
                            width: currentIndex == 1
                                ? selectedWidth
                                : normalWidth,
                            onPressed: () => onTap(1),
                          ),

                          _navItem(
                            icon: Icons.notifications_none_rounded,
                            label: "Notices",
                            selected: currentIndex == 2,
                            width: currentIndex == 2
                                ? selectedWidth
                                : normalWidth,
                            onPressed: () => onTap(2),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(width: 16),

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
              child: const Icon(Icons.search, size: 30, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}

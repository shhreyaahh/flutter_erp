import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import '../data/dummy_data.dart';
import '../widgets/notice_card.dart';

class NoticesScreen extends StatelessWidget {
  const NoticesScreen({super.key});

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

                  const Text(
                    'Notice Board',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),

                  const SizedBox(width: 28),
                ],
              ),

              const SizedBox(height: 24),

              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: notices.length,
                  itemBuilder: (context, index) {
                    final notice = notices[index];

                    return NoticeCard(
                      title: notice['title']!,
                      description: notice['description']!,
                      date: notice['date']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

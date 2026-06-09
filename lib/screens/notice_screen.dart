import 'package:flutter/material.dart';
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
                  const Icon(
                    Icons.account_circle,
                    size: 28,
                    color: Colors.black,
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

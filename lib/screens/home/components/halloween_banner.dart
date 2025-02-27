import 'package:flutter/material.dart';

class HalloweenBanner extends StatelessWidget {
  const HalloweenBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'สวัสดี, ฮาโลวีน!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'เพิ่มความน่ากลัวให้กับงานฉลองฮาโลวีนของคุณในปีนี้',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              side: const BorderSide(color: Colors.white),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: const Text(
              'ดูเพิ่มเติม',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BraceletBanner extends StatelessWidget {
  const BraceletBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1611591437281-460bfbe1220a?q=80&w=1000',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: const Center(
        child: Text(
          'กำไลข้อมือสวยๆ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(offset: Offset(1, 1), blurRadius: 3, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}

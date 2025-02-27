// ignore_for_file: deprecated_member_use

import 'dart:math';

import 'package:flutter/material.dart';

class BraceletBanner extends StatefulWidget {
  const BraceletBanner({super.key});

  @override
  State<BraceletBanner> createState() => _BraceletBannerState();
}

class _BraceletBannerState extends State<BraceletBanner> {
  final PageController _pageController = PageController();
  final List<String> _imageUrls = [
    'https://images.unsplash.com/photo-1611591437281-460bfbe1220a?q=80&w=1000',
    'https://images.unsplash.com/photo-1602173574767-37ac01994b2a?q=80&w=1000',
    'https://images.unsplash.com/photo-1599643477877-530eb83abc8e?q=80&w=1000',
    'https://images.unsplash.com/photo-1583484397737-d97084e9f5c7?q=80&w=1000',
  ];

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      onPanUpdate: (details) {
        final double delta = details.delta.dx;
        if (delta > 0) {
          if (_currentPage > 0) {
            _pageController.animateToPage(
              _currentPage - 1,
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOut,
            );
          }
        } else if (delta < 0) {
          if (_currentPage < _imageUrls.length - 1) {
            _pageController.animateToPage(
              _currentPage + 1,
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOut,
            );
          }
        }
      },
      child: SizedBox(
        height: 220,
        child: Stack(
          children: [
            // PageView for images
            PageView.builder(
              controller: _pageController,
              itemCount: _imageUrls.length,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(_imageUrls[index]),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.3),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                );
              },
            ),

            // Gradient overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.4)],
                  stops: const [0.6, 1.0],
                ),
              ),
            ),

            // Content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'กำไลข้อมือสวยๆ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 3,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'คอลเลคชั่นใหม่ล่าสุด 2025',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 2,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 3,
                    ),
                    child: const Text(
                      'ช้อปเลย',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Page indicators
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _imageUrls.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _currentPage == index
                              ? Colors.white
                              : Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

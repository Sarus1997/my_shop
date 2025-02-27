import 'package:flutter/material.dart';
import 'package:my_shop/screens/home/components/bracelet_banner.dart';
import 'package:my_shop/screens/home/components/top_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [TopBanner(), BraceletBanner()],
      ),
    );
  }
}

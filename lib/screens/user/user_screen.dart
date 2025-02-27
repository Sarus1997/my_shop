import 'package:flutter/material.dart';
import 'package:my_shop/screens/user/components/profile_page.dart';

class UserContent extends StatelessWidget {
  const UserContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [ProfilePage()],
      ),
    );
  }
}

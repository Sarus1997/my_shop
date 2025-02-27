// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(0)),
      ),
      title: Row(
        children: [
          const Text(
            'MONE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w900,
              letterSpacing: 3,
              fontFamily: 'Montserrat',
            ),
          ),
          Text(
            ' SHOP',
            style: TextStyle(
              color: Colors.amber[300],
              fontSize: 26,
              fontWeight: FontWeight.w900,
              letterSpacing: 3,
              fontFamily: 'Montserrat',
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 5),
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              color: Colors.amber[300],
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search_rounded, color: Colors.white, size: 26),
          onPressed: () {},
          splashRadius: 20,
        ),
        IconButton(
          icon: const Icon(Icons.home_rounded, color: Colors.white, size: 26),
          onPressed: () {},
          splashRadius: 20,
        ),
        Container(
          margin: const EdgeInsets.only(right: 12, left: 8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.amber[400]!, Colors.amber[300]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.amber[300]!.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.menu_rounded, color: Colors.black, size: 26),
            onPressed: () {},
            splashRadius: 20,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

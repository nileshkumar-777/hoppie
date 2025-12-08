import 'package:flutter/material.dart';
import 'package:froggie/colors.dart';

class BottomBar extends StatelessWidget {
  final VoidCallback onNext;

  const BottomBar({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Green Curve
          Container(
            width: double.infinity,
            height: 150,
            decoration: const BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(200),
                topRight: Radius.circular(200),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Next Button
          GestureDetector(
            onTap: onNext,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: accentColor,
              child: const Icon(
                Icons.arrow_forward,
                size: 34,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

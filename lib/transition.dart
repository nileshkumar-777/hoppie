import 'package:flutter/material.dart';
import 'package:froggie/colors.dart';

PageRouteBuilder createTransition(Widget screen) {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 650),
    pageBuilder: (_, __, ___) => screen,
    transitionsBuilder: (context, animation, secondary, child) {
      final slide = Tween<Offset>(
        begin: Offset(1, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic));

      final fade = CurvedAnimation(parent: animation, curve: Curves.easeInOut);

      return Stack(
        children: [
          SlideTransition(
            position: slide,
            child: Container(color: primaryColor),
          ),
          FadeTransition(opacity: fade, child: child),
        ],
      );
    },
  );
}

import 'package:flutter/material.dart';
import 'package:froggie/bottom_bar.dart';
import 'package:froggie/colors.dart';

class FocusScreen extends StatefulWidget {
  const FocusScreen({super.key});

  @override
  State<FocusScreen> createState() => _FocusScreenState();
}

class _FocusScreenState extends State<FocusScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _logoLift;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _logoLift = Tween<Offset>(
      begin: Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          // BACKGROUND + TEXT
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.10),
            child: Column(
              children: const [
                Text(
                  'FOCUS!',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  'Your Mind!',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),

                SizedBox(height: 30),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Master words, unlock treasures and level up your journey.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // CHARACTER SLIDE-UP
          Align(
            alignment: Alignment.center,
            child: SlideTransition(
              position: _logoLift,
              child: Image.asset(
                'assets/monk.png',
                height: screenHeight * 0.32,
              ),
            ),
          ),

          // CHARACTER NAME
          Align(
            alignment: Alignment(0, 0.55),
            child: const Text(
              'MOKSH',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                letterSpacing: 2,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // CONSTANT BOTTOM BAR
          BottomBar(onNext: () {}),
        ],
      ),
    );
  }
}

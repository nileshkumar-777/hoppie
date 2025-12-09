import 'package:flutter/material.dart';
import 'package:froggie/homescreen.dart';

class JourneyScreen extends StatefulWidget {
  const JourneyScreen({super.key});

  @override
  State<JourneyScreen> createState() => _JourneyScreenState();
}

class _JourneyScreenState extends State<JourneyScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideUp;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    _slideUp = Tween<Offset>(
      begin: const Offset(0, 1.0), // STARTS BELOW THE SCREEN
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 12, 30, 48), // Navy blue
      body: SlideTransition(
        position: _slideUp,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 100),

              // ------------------ TITLE ------------------
              const Text(
                "JOURNEY!",
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Awaits!",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 80),

              // ------------------ CIRCLE BG + CHARACTER ------------------
              Container(
                width: 330,
                height: 330,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 37, 37, 37).withOpacity(0.25),
                      const Color.fromARGB(255, 0, 0, 0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: Image.asset("assets/hoppie.png", height: 250),
                ),
              ),

              const SizedBox(height: 30),

              // ------------------ APP NAME ------------------
              const Text(
                "LingoBreeze",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF60CFFF),
                ),
              ),

              const SizedBox(height: 70),

              // ------------------ BUTTON ------------------
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder: (_, __, ___) => const LanguageSelectScreen(),
                      transitionsBuilder: (_, animation, __, child) {
                        final slide =
                            Tween<Offset>(
                              begin: Offset(0, 1), // from bottom
                              end: Offset.zero,
                            ).animate(
                              CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeOutCubic,
                              ),
                            );

                        return SlideTransition(position: slide, child: child);
                      },
                    ),
                  );
                },

                child: Container(
                  width: 300,
                  height: 65,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      "Let’s Get Started",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

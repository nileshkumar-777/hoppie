import 'package:flutter/material.dart';
import 'package:froggie/getstarted.dart';

const Color navy1 = Color(0xFF142B38);
const Color navy2 = Color(0xFF103050);
const Color navy3 = Color(0xFF0B2A44);

const Color accentColor = Color(0xFF8BC34A);

// ---------------------------------------------------------
// CURVED WIPE CLIPPER
// ---------------------------------------------------------
class CurveWipeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, 0);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.50,
      size.width,
      size.height,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(oldClipper) => true;
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int pageIndex = 0;

  // BACKGROUND COLORS
  final List<Color> bgColors = [navy1, navy2, navy3];

  // CLEAN TEXT WIDGETS (no background)
  final List<Widget> textWidgets = [
    Column(
      children: const [
        Text(
          "AHOY!",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Welcome aboard!",
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 60),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            "Learn Language as you sail through islands of adventure!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, color: Colors.white70, height: 1.25),
          ),
        ),
      ],
    ),

    Column(
      children: const [
        Text(
          "EXPLORE!",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "New Adventures Await",
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 60),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            "Discover new lands while learning new words!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, color: Colors.white70, height: 1.25),
          ),
        ),
      ],
    ),

    Column(
      children: const [
        Text(
          "PREPARE!",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "For the Quest!",
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 60),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            "Face tougher challenges,\nearn rare rewards & rise as a\ntrue language warrior.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, color: Colors.white70, height: 1.25),
          ),
        ),
      ],
    ),
  ];

  final List<Widget> logos = [
    Image.asset("assets/hoppie.png", height: 250),
    Image.asset("assets/monk.png", height: 250),
    Image.asset("assets/pirate.png", height: 250),
  ];

  void next() {
    if (pageIndex < 2) {
      setState(() => pageIndex++);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const JourneyScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // ---------------------------------------------------------
          // BASE BACKGROUND COLOR
          // ---------------------------------------------------------
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            color: bgColors[pageIndex],
            width: w,
            height: h,
          ),

          // ---------------------------------------------------------
          // WIPING OVERLAY COLOR ONLY
          // ---------------------------------------------------------
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 700),
            transitionBuilder: (child, animation) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
            child: ClipPath(
              key: ValueKey("wipe_$pageIndex"),
              clipper: CurveWipeClipper(),
              child: Container(
                width: w * 1.4,
                height: h,
                color: bgColors[pageIndex],
              ),
            ),
          ),

          // ---------------------------------------------------------
          // TEXT POP-IN (NORMAL)
          // ---------------------------------------------------------
          Positioned(
            top: h * 0.10,
            left: 0,
            right: 0,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(
                    scale: Tween<double>(
                      begin: 0.9,
                      end: 1.0,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
              child: SizedBox(
                key: ValueKey("text_$pageIndex"),
                child: textWidgets[pageIndex],
              ),
            ),
          ),

          // ---------------------------------------------------------
          // LOGO ANIMATION (already good)
          // ---------------------------------------------------------
          Positioned(
            top: h * 0.10 + 300,
            left: 0,
            right: 0,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 800),
              transitionBuilder: (child, animation) {
                final slideIn = Tween<Offset>(
                  begin: const Offset(0, 1.2),
                  end: Offset.zero,
                ).animate(animation);
                final slideOut = Tween<Offset>(
                  begin: Offset.zero,
                  end: const Offset(-1.2, 0),
                ).animate(animation);

                return SlideTransition(
                  position: child.key == ValueKey(pageIndex)
                      ? slideIn
                      : slideOut,
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              child: SizedBox(
                key: ValueKey(pageIndex),
                child: logos[pageIndex],
              ),
            ),
          ),

          // CHARACTER NAME
          Positioned(
            top: h * 0.10 + 300 + 250 + 10,
            left: 0,
            right: 0,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Text(
                pageIndex == 0
                    ? "HOPPIE"
                    : pageIndex == 1
                    ? "MOKSH"
                    : "PIRATE",
                key: ValueKey("name_$pageIndex"),
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          // STATIC BOTTOM CURVE
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/bottom_curves.png",
              width: w,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),

          // NEXT BUTTON
          Positioned(
            bottom: h * 0.085,
            left: 0,
            right: 0,
            child: Center(
              child: InkWell(
                onTap: next,
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: accentColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black.withOpacity(0.3),
                      width: 4,
                    ),
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

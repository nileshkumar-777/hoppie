import 'package:flutter/material.dart';

class LanguageSelectScreen extends StatefulWidget {
  const LanguageSelectScreen({super.key});

  @override
  State<LanguageSelectScreen> createState() => _LanguageSelectScreenState();
}

class _LanguageSelectScreenState extends State<LanguageSelectScreen>
    with SingleTickerProviderStateMixin {
  String? selectedLanguage;

  late AnimationController _boatController;
  late Animation<Offset> _boatSlide;

  final List<String> languages = [
    "हिन्दी",
    "English",
    "मराठी",
    "தமிழ்",
    "اردو",
    "తెలుగు",
    "ಕನ್ನಡ",
    "മലയാളം",
    "English",
  ];

  @override
  void initState() {
    super.initState();

    // ------------------- BOAT ANIMATION -------------------
    _boatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _boatSlide =
        Tween<Offset>(
          begin: const Offset(-1.5, 0), // fully left outside screen
          end: const Offset(0, 0), // final position
        ).animate(
          CurvedAnimation(parent: _boatController, curve: Curves.easeOutCubic),
        );

    _boatController.forward(); // start animation when screen appears
  }

  @override
  void dispose() {
    _boatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF062238),
      body: SafeArea(
        child: Stack(
          children: [
            // ------------------------ MAIN COLUMN ------------------------
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                // ---------------- LANGUAGE GRID ----------------
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Wrap(
                    spacing: 40,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: languages.map((lang) {
                      final isSelected = selectedLanguage == lang;

                      return GestureDetector(
                        onTap: () => setState(() => selectedLanguage = lang),
                        child: Text(
                          lang,
                          style: TextStyle(
                            fontSize: 22,
                            color: isSelected
                                ? Colors.white
                                : Colors.white.withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                SizedBox(height: h * 0.10),

                // ---------------- TEXTBOX IMAGE ----------------
                // ---------------- TEXTBOX WITH LANGUAGE INSIDE ----------------
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset("assets/textbox.png", width: w * 0.65),

                    // Selected language centered inside bubble
                    Text(
                      selectedLanguage ?? "",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // ---------------- WAVES IMAGE ----------------
                Image.asset(
                  "assets/wave.png",
                  width: 500,
                  height: 138,
                  fit: BoxFit.cover,
                ),

                const Spacer(),

                // ---------------- CONTINUE BUTTON ----------------
                Padding(
                  padding: const EdgeInsets.only(bottom: 28),
                  child: InkWell(
                    onTap: selectedLanguage == null ? null : () {},
                    child: Container(
                      width: w * 0.75,
                      height: 55,
                      decoration: BoxDecoration(
                        color: selectedLanguage == null
                            ? Colors.grey.shade600
                            : const Color(0xFF00AFC1),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Center(
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // ------------------------ BOAT ANIMATION ------------------------
            Positioned(
              top: h * 0.38, // EXACTLY BELOW TEXTBOX
              left: w * 0.18,
              child: SlideTransition(
                position: _boatSlide,
                child: Image.asset("assets/boat.png", width: 200),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

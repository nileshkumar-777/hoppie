This project is my submission for the LingoBreeze Flutter Internship Selection Assignment.
The task was to build a two-screen Flutter application that recreates the UI and animations shown in the reference video provided.

A copy of my project demo video is included inside the ZIP file along with the full Flutter project.

📸 Demo Video Included

Inside this ZIP file, you will find:

demo/
└── app_demo_video.mp4


This video demonstrates:

Welcome screen animations

Page transitions

Character slide + fade animations

Language selection animations

Boat sliding animation

Continue button activation logic

🚀 Application Overview

The app contains two animated screens as per the assignment:

1️⃣ Welcome / Onboarding Screen

Features:

Animated background color transitions

Curved wipe transition between onboarding pages

Text fade + scale animation

Character images slide-in and slide-out

Character names fade in

"Next" button with press feedback (turns brown when pressed)

2️⃣ Language Selection Screen

Features:

Animation: boat sliding from left using AnimationController

Language grid layout with tap-to-select feedback

Selected language displayed inside a bubble

Continue button becomes active only when a language is chosen

Responsive layout for different screen sizes

✨ Animations Used

This project uses the following Flutter animation classes:

AnimationController

CurvedAnimation

Tween<Offset>

SlideTransition

FadeTransition

ScaleTransition

AnimatedSwitcher

AnimatedContainer

These tools were used to recreate the exact feel and timing of the reference video.

🛠️ How to Run the Project
1. Extract the ZIP file
lingobreeze_flutter_assignment.zip

2. Open the project folder in VS Code or Android Studio
3. Install project dependencies
flutter pub get

4. Run the project
flutter run


The app can be run on:

Android emulator

iOS simulator

Physical device

Flutter web (optional)

📱 How to Use the Application
Welcome Screen

Press the Next button → transitions to the next onboarding page

Watch the animations:

Curved wipe

Character entry

Text transitions

After the third page, the app proceeds to Language Selection.

Language Selection Screen

Tap any language from the list → it highlights

Your selected language appears in the text bubble

The Continue button becomes active

Press Continue to proceed

📂 Project Folder Structure
lib/
│── main.dart
│── welcome.dart               # Animated onboarding screen
│── language_select.dart       # Language selection + boat animation
│── getstarted.dart            # Next screen after selection
│
assets/
│── hoppie.png
│── monk.png
│── pirate.png
│── boat.png
│── wave.png
│── textbox.png
│── bottom_curves.png
│
demo/
└── app_demo_video.mp4         # Demo video included for submission

🧠 Focus Areas in This Assignment

Smooth and natural animations

Pixel-accurate UI recreation based on video

Clean code structure

Meaningful comments

Readability and Flutter best practices

Consistent theme & styling

💡 Possible Improvements (Future Enhancements)

Add Hero transitions

Add background parallax animation

Add haptic feedback

Introduce Provider / Bloc for state management

Add accessibility support

👤 Author

Nilesh Kumar
Flutter Developer | AI/ML Enthusiast
GitHub: https://github.com/nileshkumar-777
hoppie repo:https://github.com/nileshkumar-777/hoppie

📝 Submission Note

This ZIP file contains:

✔ Full Flutter project
✔ All assets used
✔ Demo video showcasing animations
✔ README file (this file)

Everything has been tested and runs smoothly on Android.

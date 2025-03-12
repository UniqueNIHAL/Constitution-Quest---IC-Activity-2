
# Constitution Quest

An interactive puzzle-based Flutter app that helps you learn the basics of the Indian Constitution in a fun and engaging way.

## Table of Contents

- [Overview](#overview)  
- [Features](#features)  
- [Tech Stack](#tech-stack)  
- [Setup & Installation](#setup--installation)  
- [Usage](#usage)  
- [Build for Android](#build-for-android)  
- [License](#license)

---

## Overview

**Constitution Quest** is a multi-level Flutter game that covers:
- The **Preamble** of the Indian Constitution  
- **Fundamental Rights** and related Articles  
- Scenario-based multiple-choice **Quizzes**  

Players earn points as they solve puzzles or answer questions. It’s designed for quick learning and interactive fun.

---

## Features

1. **Level 1: Preamble Puzzle**  
   - 3 sub-levels of drag-and-drop lines from the Preamble.  
   - Scoring: 5 points if solved without retry/fail, otherwise 3 points.

2. **Level 2: Articles Matching**  
   - 3 sub-levels matching Articles to descriptions.  
   - Same scoring logic as Level 1.

3. **Level 3: Scenario Quiz**  
   - 10 scenario-based multiple-choice questions.  
   - Real-time feedback with fun facts on correct answers.

4. **Global Scoring**  
   - Total points accumulated across all levels.  
   - Displayed on the Level Select screen.

5. **BotPress Chatbot (Optional)**  
   - If you’re deploying on the web, you can embed a BotPress chatbot in your `web/index.html`.

---

## Tech Stack

- **Flutter** (3.x or higher)  
- **Dart**  
- Optional: **BotPress Webchat** for an embedded chatbot on Flutter Web

---

## Setup & Installation

1. **Clone** the repository:
   ```bash
   git clone https://github.com/yourusername/constitution_quest.git
   cd constitution_quest
   ```

2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

3. **(Optional) Add BotPress**:  
   - If you’re deploying on Flutter Web, open `web/index.html` and insert the BotPress `<script>` snippet + `<div id="webchat">`.  

4. **Run the App**:
   ```bash
   flutter run
   ```
   - Pick your device/emulator or run in Chrome (`-d chrome`) if building for web.

---

## Usage

1. **Welcome Screen**  
   - Start the game, read the description, then choose a level.

2. **Level 1 & 2**  
   - Drag-and-drop puzzle sub-levels.  
   - Press **Check** to see if correct, **Retry** to shuffle again, and **Next** to proceed.

3. **Level 3**  
   - Multiple-choice quiz with immediate feedback.  
   - Earn points for correct answers.

4. **Scoring**  
   - Level 1 & 2: 5 points if solved without retry/fail, else 3 points.  
   - Level 3: +1 point per correct answer.  
   - **Global Score** displayed on Level Select and final completion screen.

---

## Build for Android

1. **Ensure** you have the Android SDK & licenses accepted:
   ```bash
   flutter doctor --android-licenses
   ```
2. **Build the APK**:
   ```bash
   flutter clean
   flutter pub get
   flutter build apk --release
   ```
3. **Locate the APK** at:
   ```
   build/app/outputs/flutter-apk/app-release.apk
   ```
4. **Install/Share** the `.apk` with your classmates.

---



## License

This project is released under the [MIT License](LICENSE). Feel free to use and modify for educational purposes.

---

*Happy learning!* If you have any questions or suggestions, feel free to open an issue or submit a pull request.  

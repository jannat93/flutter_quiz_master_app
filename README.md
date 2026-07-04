# Flutter Quiz Master App

A modern Flutter-based quiz application developed as part of the **BdApps National Bootcamp Assignment**. The application provides an engaging quiz experience with category-based questions, performance tracking, theme persistence, and local storage support.

---

## Developer Information

**Name:** Jannatul Nayeem

**Role:** Flutter Developer

**University:** International Islamic University Chittagong (IIUC)

**GitHub Repository:** flutter_quiz_master_app

---

## Demo Video

🎥 YouTube Demo:

https://youtu.be/liPybG5eb1o?si=csvmjq9g5yXilpbD

---

## Features

### Home Dashboard
- Beautiful and modern UI
- Welcome Banner
- Statistics Dashboard
- Category Selection
- Recent Quiz History

### Theme Management
- Light Mode ☀️
- Dark Mode 🌙
- Theme persistence using SharedPreferences

### Quiz System
- Multiple Categories
- Dynamic Questions
- MCQ Selection
- Question Counter
- Progress Indicator
- Quiz Navigation

### Result Screen
- Total Questions
- Correct Answers
- Wrong Answers
- Final Score
- Percentage Calculation
- Performance Feedback

### Answer Review
- Review every submitted answer
- Correct and incorrect answer highlighting

### History Tracking
- Total Quiz Attempts
- Highest Score
- Last Score
- Recent Quiz History
- Stored locally using SharedPreferences

---

## Tech Stack

- Flutter
- Dart
- Provider
- SharedPreferences
- GoRouter

---

## Architecture

The project follows a clean and maintainable structure.

```text
lib/
├── data/
├── models/
├── providers/
├── routes/
├── screens/
├── services/
├── theme/
├── widgets/
└── main.dart
```

---

## Packages Used

```yaml
provider:
shared_preferences:
go_router:
```

---

## How to Run the Project

### Prerequisites

Before running the project, ensure you have:

- Flutter SDK installed
- Android Studio or VS Code
- Android Emulator or Physical Device

Check Flutter installation:

```bash
flutter doctor
```

---

### Clone Repository

```bash
git clone https://github.com/your-username/flutter_quiz_master_app.git
```

Navigate to the project:

```bash
cd flutter_quiz_master_app
```

---

### Install Dependencies

```bash
flutter pub get
```

---

### Run Application

```bash
flutter run
```

---

### Build APK

```bash
flutter build apk --release
```

Generated APK location:

```text
build/app/outputs/flutter-apk/app-release.apk
```

---

## Assignment Requirements Covered

✅ GoRouter Navigation

✅ SharedPreferences Local Storage

✅ Theme Persistence

✅ Multiple Quiz Categories

✅ Dynamic Quiz Screen

✅ Result Screen

✅ Statistics Dashboard

✅ Quiz History Tracking

✅ Answer Review System

✅ Clean Architecture

✅ No External API Used

---

## Learning Outcomes

Through this project, I gained practical experience in:

- Flutter UI Development
- State Management using Provider
- Local Data Persistence
- Declarative Routing with GoRouter
- Clean Project Architecture
- Custom Widget Development
- Responsive UI Design

---

## Future Improvements

- User Authentication
- Timer-Based Quiz
- Difficulty Levels
- Leaderboard System
- Firebase Integration
- Online Question Database

---

## Assignment

BdApps National Bootcamp

Flutter Quiz Master Application

Developed with ❤️ using Flutter by **Jannatul Nayeem**

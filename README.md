# 🚀 Advance Flutter Demo

A showcase of advanced Flutter development techniques including state management (GetX, setState), animations, game development, UI design, local storage, and a personal developer portfolio.

---

## 🔧 Flutter Version

- **Flutter**: `3.29.3`

---

## 🏠 Home Page

The home page serves as **My Profile Page**, showcasing the portfolio of a Flutter Developer, including skills, apps, and personal branding.

---

## 📁 Project Modules & Features

### 📦 GetX-Based Tasks (Inside `getx/` folder)

- ✅ **Logical Task**  
  Distribute coins to players using logic-based GetX state management.

- ✅ **Technical Task (To-Do App)**
    - Built with local database using Hive.
    - Add, update, delete tasks with persistent storage.

- ✅ **Quiz Game**
    - Multiple-choice quiz using GetX.
    - Real-time score tracking and result display.

- ✅ **Static UI Screens**
    - News Settings Screen
    - Daily Skincare Routine Screen
    - Modern Smart Home UI
    - Donut App UI

---

### 🕹️ `setState()` Based Game Apps

- 🎮 **Snake Game**  
  Classic snake game implemented with `setState`.

- ❌⭕ **Tic Tac Toe**  
  A 2-player tic tac toe game with win detection and reset.

---

### 🎞️ Animation Zone

- 🔢 **Counter Animation**  
  A smooth, number-incrementing counter using animation controller.

- ⏰ **Clock Loader Animation**  
  A custom animated loading spinner resembling a ticking clock.

---

### 💰 Expense Tracker App

An intuitive and dynamic expense tracking system with the following features:

- ➕ **Add Expense**  
  Record new expenses with category, amount, and timestamp.

- ❌ **Delete Expense**  
  Remove any entry from the expense list.

- 📃 **Expense List**  
  View all expenses in a scrollable, styled list.

- 📊 **Chart Visualization**
    - Weekly expense breakdown starting from **Sunday**.
    - Bar chart that summarizes daily spending.
    - Converts expense list into **daily expense summary** for visual analysis.

---
### **Installation Instructions:**

To run this app locally, follow these steps:

1. Clone this repository:

   ```bash
   git clone https://github.com/duvi03/advance-flutter-demo.git

2. Navigate into the project directory:

    ```bash
   cd advance_flutter_demo
3. Install the dependencies:

    ```bash
   cd flutter pub get

4. Run the app:

    ```bash
   cd flutter run

[//]: # (## 📸 Screenshots &#40;Optional&#41;)

[//]: # ()
[//]: # (> *&#40;Add screenshots here if you want to visually showcase each section of the app&#41;*)

[//]: # ()
[//]: # (---)

[//]: # ()
[//]: # (## 📂 Folder Structure Overview)

[//]: # ()
[//]: # (```plaintext)

[//]: # (lib/)

[//]: # (├── main.dart)

[//]: # (├── home/                     # Profile homepage)

[//]: # (├── getx/)

[//]: # (│   ├── logic_task/           # Coin distribution)

[//]: # (│   ├── technical_task/       # Hive-based ToDo app)

[//]: # (│   ├── quiz_game/)

[//]: # (│   └── static_ui/            # News, Skincare, Smart Home, Donut App)

[//]: # (├── games/)

[//]: # (│   ├── snake_game/)

[//]: # (│   └── tic_tac_toe/)

[//]: # (├── animations/)

[//]: # (│   ├── counter_animation/)

[//]: # (│   └── clock_loader/)

[//]: # (├── expense_tracker/)

[//]: # (└── shared_widgets/)
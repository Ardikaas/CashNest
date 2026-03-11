<div align="center">

# 🪹 CashNest

**Smart Income Allocator for Financial Freedom**

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart)](https://dart.dev)
[![GetX](https://img.shields.io/badge/State_Management-GetX-5E5DF0?logo=flutter)](https://pub.dev/packages/get)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-lightgrey)]()

*Manage your wallet structure by automatically separating daily budgets, savings, investments, and emergency funds to achieve financial independence.*

</div>

---

## 📖 About the App

**CashNest** was born from the idea that money left idle in a single main account tends to run out quickly. This application helps educate and condition users to perform **"Wallet Allocation"** (Pemecahan Dompet).

Every time there is an income (monthly salary, freelance, gifts, or bonuses), CashNest will immediately provide a preview of how the money should be distributed to various financial goals based on the percentages set by the user.

### 🎯 Core Features

* **🏦 Account & Wallet Management**: Clearly separate the tracking between *where the money physically resides* (Real Bank Accounts/Cash) and *what the money is intended for* (Daily Wallet, Savings, Investments, Emergency).
* **📊 Smart Income Allocation**: The flagship feature! Upon receiving income, the app will automatically calculate and provide a slider preview for distributing the funds across your wallets.
* **🎨 Clean & Beautiful UI**: A modern, responsive interface designed to give a premium and visually pleasing experience.

---

## 🛠️ Tech Stack & Architecture

This project is built using industry standards to ensure neat, scalable, and maintainable development:

* **Framework**: [Flutter](https://flutter.dev/) (targetting iOS & Android).
* **State Management & Routing**: [GetX Ecosystem](https://pub.dev/packages/get). Chosen for its performance in Reactive State (`Rx`) and the simplicity of Dependency Injection.
* **Fonts**: [Google Fonts (Plus Jakarta Sans)](https://fonts.google.com/specimen/Plus+Jakarta+Sans) for modern typography.

### 📁 Main Folder Structure

CashNest uses the Feature-First Pattern (GetX Pattern):

```text
lib/
├── app/                  # Logic & Data
│   ├── bindings/         # Global Dependency Injection
│   ├── data/             # Models, Providers, Repositories, Services
│   ├── modules/          # Screens (Feature-First: UI + Controllers + Bindings)
│   │   ├── dompet/       # Wallet features (View, Detail, Settings)
│   │   ├── home/         # Dashboard / Home Screen
│   └── routes/           # Route Definitions and Page Mapping
├── core/                 # Core Application Components
│   ├── theme/            # Central Theme (AppTheme)
│   ├── utils/            # Helpers & Formatting
│   └── values/           # Constants & AppColors
└── global_widgets/       # Reusable UI across multiple modules
```

---

## 🚀 Getting Started

If you want to run this project locally:

1. **Ensure the environment is ready:**
   * Latest Flutter SDK
   * Android Studio / Xcode

2. **Clone this repository:**

   ```bash
   git clone <repository_url>
   cd cashnest
   ```

3. **Install dependencies:**

   ```bash
   flutter pub get
   ```

4. **Run the application:**

   ```bash
   flutter run
   ```

---

## 🤖 Context for AI Agents

If a Virtual AI or Agent is working on this repository (e.g., building Backend Modules, setting up the Database, or adding UI features), it is **MANDATORY** to read the following documentation before writing code:

1. 📄 [`AGENT.md`](./AGENT.md) - The main business logic guide, explaining Wallet Allocation and transaction rules.
2. 📄 [`ARCHITECTURE.md`](./ARCHITECTURE.md) - Coding standards for the CashNest frontend (proper GetX usage).

---
<div align="center">
  Built with ❤️ for a better financial future.
</div>

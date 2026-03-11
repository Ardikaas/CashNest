# CashNest - Architecture Guide

This project follows **industry standards** for scalable Flutter applications, specifically utilizing the **GetX Ecosystem** as requested for state management, dependency injection, and route management.

## 1. Directory Structure

We use a feature-first / module-first folder structure. This pattern ensures that all files related to a specific screen (Controller, View, Binding) are kept neatly together.

```text
lib/
├── app/
│   ├── bindings/        # Global bindings (e.g., InitialBindings that load on app start)
│   ├── data/            # Data Layer (All things related to data processing and APIs)
│   │   ├── models/        # Application Data Models (User, Wallet, Transaction objects)
│   │   ├── providers/     # API Providers / Network calls (Dio or HTTP clients)
│   │   ├── repositories/  # Repositories abstracting the data sources (API vs Local DB)
│   │   └── services/      # Local background services (SharedPreferences, GetStorage, SQLite)
│   ├── modules/         # UI & Logic layer (Organized by features/screens)
│   │   ├── home/
│   │   │   ├── bindings/     # HomeBinding (Injects HomeController)
│   │   │   ├── controllers/  # HomeController (State & Logic)
│   │   │   └── views/        # HomeView (UI only, listens to HomeController)
│   │   └── splash/
│   └── routes/          # Navigation Management
│       ├── app_pages.dart   # Page to Binding and Route mapping
│       └── app_routes.dart  # Route name constants (e.g., static const HOME = '/home';)
├── core/                # Core Application tools & utilities
│   ├── theme/             # App colors, typography, styles, and light/dark themes
│   ├── utils/             # Helper tools, extensions, formatters (e.g., IDR Currency formatter)
│   └── values/            # Constants, strings, API URLs, asset paths
├── global_widgets/      # Reusable UI components used across multiple modules (e.g., CustomTextField)
└── main.dart            # Application Entry Point
```

## 2. Core Tools & Ecosystem

1. **State Management**: GetX. Specifically utilizing reactive state (`Rx<T>`, `Obx()`) for variables that change often (like Wallet Balances), and simple state builder (`GetBuilder`) where memory efficiency is prioritized and reactivity isn't strictly needed.
2. **Dependency Injection**: Handled via GetX `Bindings`.
    * Use `Get.lazyPut(() => MyController())` to instantiate controllers only when they are utilized in the View.
    * Use `Get.put()` for services that must stay alive (e.g., `DatabaseService` or `AuthService`).
3. **Routing**: Utilize GetX named routes (`Get.toNamed()`, `Get.offAllNamed()`) to decouple navigation from views and keep history manageable.

## 3. Best Practices Rules defined for Agents

If you are an AI attempting to write code for CashNest, strictly adhere to the following rules:

* **View Layer Separation**: `*View.dart` files must **ONLY** contain UI code. Do not handle business logic, data fetching, or calculations inside the view. Trigger methods from the controller.
* **Controller Logic**: The `*Controller.dart` handles the state for a specific View. It holds the variables and interacts with Repositories/Services to fetch/mutate data.
* **The Repository Pattern**: Controllers should not call the API or Database directly. They should call a `Repository`. The `Repository` is responsible for fetching data from the API (`Provider`) or local cache (`Service`), allowing the app to swap data sources seamlessly later.
* **Clean Core Folder**: Keep the `core/` folder clean and highly modular. Do not hardcode magic strings (e.g., 'Rp', 'Roboto') in the views. Reference them via constants inside `core/values` or `core/theme`.
* **Reusable Widgets**: If you build a card or a button that is used in more than one module, instantly extract it into `lib/global_widgets/`.
* **Responsiveness**: Build UI with different screen sizes in mind. Avoid hardcoded `height` or `width` values when possible, use flexible layouts (`Expanded`, `Flexible`, `MediaQuery`, or GetX's Context extensions like `context.width`).

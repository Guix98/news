# 📰 News Responsive App

A clean, responsive, multilingual news app built with **Flutter** using the [NewsAPI](https://newsapi.org). This project serves as a code challenge and showcases scalable architecture, real-world APIs, responsive layout, and elegant UI using [shadcn_flutter](https://pub.dev/packages/shadcn_flutter).

---

## ✨ Features

- 🔗 Consume public data from [NewsAPI](https://newsapi.org/docs)
- 📱 Fully responsive: supports mobile, tablet, and web
- 🌐 Multi-language support (English 🇺🇸 & Spanish 🇪🇸)
- 🧭 Navigation with `GoRouter` + `ShellRoute` layout
- 🧠 State management with `Riverpod` (with annotations)
- 📦 Typed models with `Freezed` and `JsonSerializable`
- 🔎 Filter news by keyword, country, or domain
- 🎨 Styled UI using `shadcn_flutter`
- 💬 Localized UI content with `.arb` files
- 🧱 Modular architecture: `data`, `domain`, `presentation` per feature

---

## 🗂️ Project Structure

```
lib/
├── core/                       # Global configuration
│   ├── config/                 # Dio client, env, themes
│   ├── localization/           # .arb files, generated l10n
│   ├── router/                 # App router with ShellRoute
│   ├── extensions/             # e.g., context.screenSize
│   ├── utils/                  # Responsive helpers, etc.
│   └── widgets/                # Shared widgets like NavigationShell
├── modules/
│   ├── headlines/              # Headlines screen + article model
│   ├── search/                 # Search by keyword
│   ├── country/                # Filter by country code
│   ├── domains/                # Filter by domain
│   └── sources/                # Source listing from /v2/sources
├── shared/                     # Reusable components (buttons, cards, etc.)
└── main.dart                   # Entry point with ShadcnApp.router
```

---

## 🚀 How to Run

1. Clone the repo:
   ```bash
   git clone https://github.com/your-org/news_responsive_app.git
   cd news_responsive_app
   ```

2. Create a `.env` file:
   ```
   NEWS_API_KEY=your_api_key_here
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Generate Freezed/Riverpod code:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

5. Run the app:
   ```bash
   flutter run -d chrome  # or any device
   ```

---

## 🌍 Internationalization

- All text is defined in `.arb` files under `lib/core/localization/l10n`.
- Supports **English** and **Spanish** via Flutter's `gen-l10n`.

---

## 📡 API Integration

- **Top Headlines**: `/v2/top-headlines`
- **Search**: `/v2/everything?q=keyword`
- **Sources**: `/v2/top-headlines/sources`
- Uses a global `DioClient` for all requests with error handling and timeouts.

---

## 🧱 Architecture

Follows a clean modular structure:

- `data/`: DTOs, repositories, service calls
- `domain/`: Freezed models
- `presentation/`: UI + state providers

---

## 📏 Responsiveness

- Uses `context.screenSize` to detect `mobile`, `tablet`, or `desktop`
- Adaptive layouts via `AdaptiveGridView`
- Global breakpoints can be customized via `breakpoints.dart`

---

## 🧪 Current Pages

| Route              | Description                          |
|--------------------|--------------------------------------|
| `/`                | Home - Top headlines                 |
| `/search?q=...`    | Search by keyword                    |
| `/country?code=us` | News filtered by country             |
| `/domains?domain=` | News filtered by domain (e.g. CNN)   |
| `/sources`         | List of all available sources        |

---

## 💡 Future Ideas

- Add pagination support
- Cache results locally
- Light/dark theme toggle
- Bookmark/save articles

---

## 👨‍💻 Author

Created by [Guido Hernani](https://github.com/your-username) as part of a Flutter code challenge using the latest 2025 stack.

---

## 📄 License

MIT
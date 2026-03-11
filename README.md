# Cartee App

A modern Flutter e-commerce marketplace application where users can browse, buy, and sell second-hand and new products across various categories.

## Features

- **Authentication** — Login, Signup, OTP verification with auto-jump input fields
- **Home Screen** — Banner carousel, product suggestions, most demanded items, and category browsing
- **Product Details** — Detailed product view with image carousel, seller info, and reviews
- **Cart & Pinned Items** — Add items to cart or pin favorites for later
- **Chat** — In-app messaging interface
- **Notifications** — Stay updated with alerts
- **User Profile** — View and manage your profile
- **Category Selection** — Personalized category preferences on onboarding

## Tech Stack

| Technology | Purpose |
|---|---|
| **Flutter** | Cross-platform UI framework |
| **Provider** | State management |
| **Google Fonts** | Typography |
| **Dart** | Programming language |

## Project Structure

```
lib/
├── core/
│   ├── constants/        # App colors, strings, icons, images
│   └── theme.dart        # App theme configuration
├── models/               # Data models (Product, Category, etc.)
├── providers/            # Global state providers (Cart, Pinned)
├── presentation/
│   ├── auth/             # Login, Signup, OTP screens & widgets
│   ├── bottomnav/        # Bottom navigation bar
│   ├── cart/             # Shopping cart
│   ├── chat/             # Chat screen
│   ├── home/             # Home screen, banner, product cards, categories
│   ├── notification/     # Notifications
│   ├── pinned/           # Pinned/favorite items
│   ├── product_details/  # Product detail view
│   ├── profile/          # User profile
│   └── splash/           # Splash screen
└── main.dart             # App entry point
```

## Getting Started

### Prerequisites

- Flutter SDK `^3.8.1`
- Dart SDK
- Android Studio / VS Code

### Installation

```bash
# Clone the repository
git clone <repository-url>

# Navigate to the project directory
cd cartee_app

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Build APK

```bash
# Debug build
flutter build apk --debug

# Release build
flutter build apk --release
```

The release APK will be generated at:
```
build/app/outputs/flutter-apk/app-release.apk
```

## Screenshots

The app includes the following screens:
- Splash Screen
- Login & Sign Up
- OTP Verification
- Category Selection
- Home Screen with Banner & Product Grid
- Product Details
- Cart & Pinned Items
- Chat & Notifications
- User Profile

## Assets

- `assets/images/` — Background images, banners, and product placeholders
- `assets/icons/` — Category and UI icons

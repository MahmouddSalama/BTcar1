# BTCar 🚗🔋

BTCar is a modern Flutter-based application designed to provide essential vehicle maintenance services on the go. Whether you need a tire change, battery replacement, or a quick jump-start, BTCar connects you with the services you need, right where you are.

---

## 🌟 Key Features

### 👤 User Features
- **Onboarding Experience**: Smooth introduction to the app's core services.
- **Service Catalog**: 
  - **Tires**: Inflation, shop changes, spare changes, and professional fixing.
  - **Batteries**: Maintenance, jump-starts (subscriptions), replacements, and health checks.
- **Location-Based Ordering**: Integrated **Google Maps** for pin-pointing your exact location when requesting assistance.
- **Flexible Payments**: Support for multiple payment methods.
- **User Profiles**: Manage personal information and order history.
- **Order Tracking**: Keep tabs on your service requests in real-time.

### 🛠️ Admin Features
- **Admin Dashboard**: Overview of all service requests and system status.
- **Order Management**: Detailed view and processing of user orders.

---

## 🚀 Tech Stack

- **Framework**: [Flutter](https://flutter.dev/) (Dart)
- **Backend/Database**: [Firebase Firestore](https://firebase.google.com/docs/firestore)
- **Authentication**: [Firebase Auth](https://firebase.google.com/docs/auth)
- **Maps**: [Google Maps Flutter](https://pub.dev/packages/google_maps_flutter)
- **Location**: [Geolocator](https://pub.dev/packages/geolocator)
- **UI/UX**: [Sizer](https://pub.dev/packages/sizer) for responsive design, Custom Widgets.

---

## 📂 Project Structure

```text
lib/
├── main.dart             # App entry point & Firebase initialization
├── constant.dart         # Global constants (colors, fonts)
├── model/                # Data models (Order, Vehicle, User, Payment)
├── services/             # Firebase & Business logic services
├── views/                # UI Screens
│   ├── auth_screens/     # Login, Register, Password Reset
│   ├── user/             # User-specific screens (Home, Orders, Details)
│   ├── admin/            # Admin dashboard and management
│   └── shared/           # Common screens (Onboarding, Profile)
├── widgets/              # Reusable UI components
└── firebase_options.dart # Firebase configuration
```

---

## 🛠️ Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Dart SDK](https://dart.dev/get-started)
- A Firebase project (for full functionality)

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/MahmouddSalama/btcar.git
   cd btcar
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Firebase Setup**:
   - Create a project on [Firebase Console](https://console.firebase.google.com/).
   - Add Android/iOS apps and download `google-services.json` / `GoogleService-Info.plist`.
   - Use `flutterfire configure` to generate/update `lib/firebase_options.dart`.

4. **Run the app**:
   ```bash
   flutter run
   ```

---

## 📖 Usage

1. **Sign Up/Login**: Create an account or sign in to access services.
2. **Select Service**: Choose between "Tires" or "Batteries" from the home screen.
3. **Choose Product**: Browse through available maintenance options and select one.
4. **Place Order**: Provide your current location via the map, select a payment method, and confirm your order.
5. **Manage**: Track your orders and manage your profile from the dedicated screens.

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

---

## 📄 License

This project is licensed under the MIT License - see the `LICENSE` file for details. (Note: Ensure a LICENSE file is present in the root).

---

*Made with ❤️ for car enthusiasts.*


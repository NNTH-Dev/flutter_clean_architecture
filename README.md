# flutter_clean_architecture

Flutter app using [Clean Architecture x Provider]

## 📱 Screenshots

| ![Screen1](screenshots/1.png) | ![Screen2](screenshots/2.png) | ![Screen3](screenshots/3.png) | ![Screen4](screenshots/4.png) |
| ----------------------------- | ----------------------------- | ----------------------------- | ----------------------------- |

## 🚀 Requirement

- Flutter **3.24.0+**
- Dart **3.5.0+**
- Android Studio/VSCode
- Java 11+ (Android)
- CocoaPods (iOS)

## 🛠️ Setting

```bash
git clone https://github.com/NNTH-Dev/flutter_clean_architecture.git
cd ./Demo-Mobilio
flutter pub get
```

# Run with default equipment

```bash
flutter run
```

# Run with specific equipment

```bash
flutter run -d [device_id]
```

## 🛠️ Structure

.

```bash
lib/
├── core/
│ ├── mock/
│ ├── res/
│ ├── network/
│ └── utils/
│ └── routes/
└── feature/name-feature/
│ ├── data/
│ │ ├── services/
│ │ ├── models/
│ │ └── repositories/
│ ├── domain/
│ │ ├── entities/
│ │ └── repositories/
│ │ └── usecases/
│ └── presentation/
│   ├── view_model/
│   ├── screens/
│   └── widgets/
└──

```

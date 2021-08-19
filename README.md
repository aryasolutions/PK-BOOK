# pk_book

# Run with --no-sound-null-safety Flutter project.
flutter run --no-sound-null-safety
flutter build web --no-sound-null-safety
flutter run -d chrome --release --no-sound-null-safety
## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# PK-BOOK

# github
echo "# PK-BOOK" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/aryasolutions/PK-BOOK.git
git push -u origin main

# Can we check the device to be smartphone or tablet in Flutter?
# Here's the same than in other aswers, but returning an enum instead of a bool or a String. As it's more closed, it's easier to use it.
import 'package:flutter/widgets.dart';

enum DeviceType { Phone, Tablet }

DeviceType getDeviceType() {
  final data = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
  print(data.size.width);
  return data.size.shortestSide < 550 ? DeviceType.Phone : DeviceType.Tablet;
}

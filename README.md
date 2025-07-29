# BVG Departures App

A Flutter application to display upcoming departures for a selected BVG stop, built with clean architecture and Riverpod.

## Features
- Search for BVG stops with autocomplete suggestions
- Select a stop to view the next 30 departures
- Display departure details: transport type, name, icon, direction, planned departure, delays, and platform
- Clear search and start a new search
- Responsive UI for iOS and Android

## Prerequisites
- Flutter 3.32.0
- Android SDK 35
- Xcode 16 (for iOS)
- Dart 3.0.0 or higher

## Setup
1. Clone the repository:
   ```
   git clone https://github.com/ra-develop/bvg_departures_app.git
   ```
2. Install dependencies:
   ```
   flutter pub get
   ```
3. Generate JSON serialization code:
   ```
   dart run build_runner build --delete-conflicting-outputs
   ```
4. Run the app:
   ```
   flutter run -t lib/main.dart
   ```

## Build APK
```
flutter build apk -t lib/main.dart
```

## Dependencies
- `flutter_riverpod`: State management
- `dio`: HTTP client for BVG API
- `dart_json_mapper`: JSON serialization
- `go_router`: Navigation
- `flutter_typeahead`: Autocomplete search
- `equatable`: Value equality
- `intl`: Date formatting

## Design Notes
- Typography: Inter font (Medium and SemiBold weights) as per Foundations.pdf
- Colors: BVG Blue (0xFF003087), white surface, black text, state-layer overlay
- Components: Top app bar, full-screen search, list items with state-layer overlay
- Layouts: Based on 1.0_index and 2.0_Search_FullScreen* from Layouts.pdf

## API
- Uses BVG public REST API: https://v6.bvg.transport.rest
- Endpoints: `/stops` for search, `/stops/{stopId}/departures` for departures

## Notes
- The project assumes Material Design icons for transport types; custom icons can be added as per design documents.
- Run `dart run build_runner watch --delete-conflicting-outputs` for continuous code generation during development.
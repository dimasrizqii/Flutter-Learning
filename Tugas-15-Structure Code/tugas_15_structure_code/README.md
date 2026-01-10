# tugas_15_structure_code

A Flutter project implementing Clean Architecture with GoRouter, Dio HTTP, and BLoC for state management.

## Features
- Clean Architecture (Presentation, Domain, Data layers)
- GoRouter for navigation
- Dio for HTTP requests
- BLoC for state management
- Integration with JSONPlaceholder API (https://jsonplaceholder.typicode.com/posts)

## Structure
- `lib/core/`: Dependency injection
- `lib/data/`: Data sources and repositories
- `lib/domain/`: Entities, repositories, and use cases
- `lib/presentation/`: BLoCs, pages, and widgets
- `lib/routes/`: GoRouter configuration

## Getting Started
1. Run `flutter pub get`
2. Run the app on an emulator or device

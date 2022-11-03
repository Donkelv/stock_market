# Stock Market


[![fvm][fvm_badge]][fvm_link]
[<img src="https://riverpod.dev/img/logo.png" height="25" width="30" />][Riverpod_link]




## Getting Started 🚀

This project contains 2 flavors:

- development
- production



To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run -t lib/main_dev.dart 

# Production
$ flutter run -t lib/main_prod.dart 

```

## State Management


This project uses Riverpod for state management [<img src="https://riverpod.dev/img/logo.png" height="25" width="30" />][Riverpod_link]


## Architecture

This project uses clean architecture. The clean architecture will divide the Flutter project into 3 main layers namely:

- data
- domain
- presentation

## data layer
The data layer consists of my notifiers, providers and few utils

## domain layer
The domain layer consists of my core logic, my entities, api requests and code generation for my classes

## presentation layer
This layer contains my pages, widgets and utils for same



## Code generation


For code generation i use [Freezed ][Freezed_link]










[Freezed_link]: https://pub.dev/packages/freezed
[Riverpod_Badge]: https://riverpod.dev/img/logo.png
[Riverpod_link]: https://pub.dev/packages/flutter_riverpod
[intl_link]: https://pub.dev/packages/intl
[Firebase_link]: https://pub.dev/packages/firebase_core
[fvm_badge]: https://fvm.app/img/logo.svg
[fvm_link]: https://fvm.app/



<img src="https://github.com/aldob-mohamed96/task_products/blob/main/images/Simulator%20Screenshot%20-%20iPhone%2016%20Plus%20-%202025-04-28%20at%2017.11.42.png" width="500" height="800">
<img src="https://github.com/aldob-mohamed96/task_products/blob/main/images/Simulator%20Screenshot%20-%20iPhone%2016%20Plus%20-%202025-04-28%20at%2017.11.49.png" width="500" height="800">
<img src="https://github.com/aldob-mohamed96/task_products/blob/main/images/Simulator%20Screenshot%20-%20iPhone%2016%20Plus%20-%202025-04-28%20at%2017.11.59.png" width="500" height="800">
<img src="https://github.com/aldob-mohamed96/task_products/blob/main/images/Simulator%20Screenshot%20-%20iPhone%2016%20Plus%20-%202025-04-28%20at%2018.42.34.png"width="500" height="800">
<img src="https://github.com/aldob-mohamed96/task_products/blob/main/images/Simulator%20Screenshot%20-%20iPhone%2016%20Plus%20-%202025-04-28%20at%2018.42.34.png"width="500" height="800">




# Product Task

Task Products is a Flutter-based mobile app designed to fetch products from an API, display them in a stylish list with their images, titles, and prices, and allow users to add or remove items from a shopping cart




##  App setup instructions


git clone https://github.com/aldob-mohamed96/task_products

cd task_products

flutter pub get flutter pub run build_runner build --delete-conflicting-outputs 

flutter run
## Dependencies used

flutter  3.29.2

Package | Description

flutter_bloc | State management (BLoC pattern)

bloc | Core BLoC package

dio | Powerful HTTP client for Dart


pretty_dio_logger | Logs network requests nicely

cached_network_image | Caches network images

hive | Lightweight local database

hive_flutter | Hive extension for Flutter

hive_generator | Code generator for Hive

build_runner | Code generation

equatable | Value equality without boilerplate

dartz | Functional programming (Either/Option)



formz | Form validation made easy


get_it | Dependency injection

badges | Add badges to icons

lottie | Render Lottie animations

flutter_svg | SVG image rendering

internet_connection_checker_plus | Internet connectivity check

## Brief explanation of structure
## 📂 Project Structure
```
lib/
├── app/
│   ├── devlopment.dart
│   ├── production.dart
│   └── testing.dart
├── core/
│   ├── di/
│   │   └── locator.dart
│   ├── enum/
│   │   └── enums.dart
│   ├── error/
│   │   ├── error_handler.dart
│   │   └── failure.dart
│   ├── extension/
│   │   ├── api_url.dart
│   │   ├── bloc.dart
│   │   ├── context.dart
│   │   ├── data_source.dart
│   │   ├── data_type.dart
│   │   ├── functions.dart
│   │   └── widget.dart
│   ├── input_validation_form/
│   │   ├── input_form.dart
│   │   └── validation.dart
│   ├── logger/
│   │   └── logger.dart
│   ├── network/
│   │   ├── api.dart
│   │   └── dio_factory.dart
│   ├── resources_manager/
│   │   ├── api_codes.dart
│   │   ├── api_messages.dart
│   │   ├── assets.dart
│   │   ├── color.dart
│   │   ├── constant.dart
│   │   ├── font.dart
│   │   ├── strings.dart
│   │   └── values.dart
│   ├── routes/
│   │   ├── pages.dart
│   │   └── routes.dart
│   ├── service/
│   │   ├── app_preferance.dart
│   │   ├── base_usecase.dart
│   │   ├── bottom_nav_bar.dart
│   │   └── network_info.dart
│   └── widgets/
│       ├── empty_content.dart
│       ├── error_content.dart
│       ├── font.dart
│       ├── image_network.dart
│       ├── input.dart
│       ├── input_border.dart
│       ├── loading.dart
│       ├── main_screen.dart
│       └── show_dialog_snackbar.dart
├── features/
│   ├── auth/
│   │   ├── data/
│   │   │   ├── data_source/
│   │   │   │   ├── local_data_source/
│   │   │   │   │   └── local_data_source.dart
│   │   │   │   └── remote_data_source/
│   │   │   │       └── remote_data_source.dart
│   │   │   ├── repository_impl/
│   │   │   │   └── auth_repository_impl.dart
│   │   │   └── request/
│   │   │       └── auth_request.dart
│   │   ├── domain/
│   │   │   ├── entity/
│   │   │   │   └── user.dart
│   │   │   ├── repository/
│   │   │   │   └── auth_repository.dart
│   │   │   └── usecase/
│   │   │       ├── change_authentication_usecase.dart
│   │   │       ├── get_authentication_usecase.dart
│   │   │       ├── login_usecase.dart
│   │   │       └── logout_usecase.dart
│   │   └── presentation/
│   │       ├── logic/
│   │       │   ├── authentication/
│   │       │   │   ├── authentication_cubit.dart
│   │       │   │   └── authentication_state.dart
│   │       │   ├── login/
│   │       │   │   ├── login_cubit.dart
│   │       │   │   └── login_state.dart
│   │       │   └── register/
│   │       └── view/
│   │           └── login/
│   │               ├── login_screen.dart
│   │               └── widgets/
│   ├── cart/
│   │   ├── data/
│   │   │   ├── data_source/
│   │   │   │   ├── local_data_source/
│   │   │   │   │   └── local_data_source.dart
│   │   │   │   └── remote_data_source/
│   │   │   ├── repositories_impl/
│   │   │   │   └── cart_repository_impl.dart
│   │   │   └── response/
│   │   │       ├── cart_response.dart
│   │   │       └── cart_response.g.dart
│   │   ├── domain/
│   │   │   ├── entity/
│   │   │   │   └── cart_item.dart
│   │   │   ├── repositories/
│   │   │   │   └── cart_repository.dart
│   │   │   └── usecase/
│   │   │       ├── add_item_cart_usecase.dart
│   │   │       ├── clear_cart_usecase.dart
│   │   │       ├── delete_item_cart_usecase.dart
│   │   │       ├── get_all_items_cart_usecase.dart
│   │   │       ├── get_cart_count_usecase.dart
│   │   │       ├── get_item_cart_usecase.dart
│   │   │       └── update_item_cart_usecase.dart
│   │   └── presentation/
│   │       ├── logic/
│   │       │   └── cart/
│   │       │       ├── cart_cubit.dart
│   │       │       └── cart_state.dart
│   │       └── view/
│   │           ├── cart_screen.dart
│   │           └── widget/
│   │               └── cartItem_view.dart
│   └── home/
│       ├── data/
│       │   ├── data_source/
│       │   │   ├── local_data_souce/
│       │   │   └── remote_data_source/
│       │   │       └── remote_data_source.dart
│       │   ├── mapper/
│       │   │   └── product_mapper.dart
│       │   └── repository_impl/
│       │       └── repository_impl.dart
│       ├── domain/
│       │   ├── entity/
│       │   │   └── product.dart
│       │   ├── repository/
│       │   │   └── repository.dart
│       │   └── usecase/
│       │       └── get_product_usecase.dart
│       └── presentation/
│           ├── logic/
│           │   └── home/
│           │       ├── home_cubit.dart
│           │       └── home_state.dart
│           └── view/
│               └── home/
│                   ├── home_screen.dart
│                   ├── product_cart.dart
│                   └── show_product_details.dart
└── main.dart

```



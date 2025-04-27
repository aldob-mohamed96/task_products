import 'dart:io';

import 'package:almusanid/features/catogery/data/repository_impl/catogery_repository_impl.dart';
import 'package:almusanid/features/catogery/domain/repository/catogery_repostory.dart';
import 'package:almusanid/features/home/data/repository_impl/home_repository_impl.dart';
import 'package:almusanid/features/home/domain/repository/home_repository.dart';
import 'package:almusanid/features/home/logic/home/home_cubit.dart';
import 'package:almusanid/features/home/logic/orders/orders_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:almusanid/core/network/api.dart';
import 'package:almusanid/core/network/dio_factory.dart';
import 'package:almusanid/core/service/app_preferance.dart';
import 'package:almusanid/core/service/launcher.dart';
import 'package:almusanid/core/service/network_info.dart';
import 'package:almusanid/core/widget/show_dialog_snackbar.dart';
import 'package:almusanid/features/general/data/repostory_impl/repository_impl.dart';
import 'package:almusanid/features/general/domain/repository/app_repository.dart';
import 'package:almusanid/features/general/domain/usecase/change_authentication_usecase.dart';
import 'package:almusanid/features/general/domain/usecase/get_authentication_usecase.dart';
import 'package:almusanid/features/general/domain/usecase/lang_usecase.dart';
import 'package:almusanid/features/general/presernatation/logic/authentication/authentication_cubit.dart';
import 'package:almusanid/features/general/presernatation/logic/langauge/langauge_cubit.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_products/core/network/dio_factory.dart';
import 'package:task_products/core/service/app_preferance.dart';
import 'package:task_products/core/service/network_info.dart';

import '../../features/catogery/logic/catogeries/catogeries_cubit.dart';
import '../../features/catogery/logic/sub_catogery/sub_catogery_cubit.dart';
import '../../features/general/presernatation/logic/policy/policy_cubit.dart';
import '../../features/home/logic/address/address_cubit.dart';
import '../../features/home/logic/check_out_pay/check_out_pay_cubit.dart';
import '../../features/home/logic/check_product_and_address_before_pay/check_product_and_address_before_pay_cubit.dart';
import '../../features/home/logic/notification/notification_cubit.dart';
import '../../features/home/logic/order_details/order_details_cubit.dart';
import '../../features/home/logic/reviews/reivews_cubit.dart';
import '../../features/home/logic/product_details/product_details_cubit.dart';
import '../../features/home/logic/search/search_cubit.dart';
import '../../features/home/logic/seller_details/seller_details_cubit.dart';
import '../../features/home/logic/user_cart/user_cart_cubit.dart';
import '../../features/menu/logic/menu/menu_cubit.dart';
import '../../features/menu/logic/wallet/wallet_cubit.dart';
import '../../firebase_options.dart';
import '../service/local_notification.dart';
import '../service/permission.dart';
import 'factory_locator.dart';

final instance = GetIt.instance;
Future<void> initAppServicesGetIt() async {
  await general();
  showDialogAndSnackbar();
  authentication();
  langauge();

  launchUrl();
  HomeAndCardsAndCategories();
}

Future<void> general() async {
  //internet connection
  instance.registerLazySingleton(() => InternetConnection());
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: instance()));



  AndroidOptions getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
      keyCipherAlgorithm:
          KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding,
      storageCipherAlgorithm: StorageCipherAlgorithm.AES_CBC_PKCS7Padding);
  IOSOptions getIOSOptions() => const IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
      synchronizable: true);
  instance.registerLazySingleton<FlutterSecureStorage>(() =>
      FlutterSecureStorage(
          iOptions: getIOSOptions(), aOptions: getAndroidOptions()));

  instance.registerLazySingleton<AppPreferences>(() => AppPreferencesImpl(
        
        secureStorage: instance(),
      ));
  // remote
  instance.registerLazySingleton<IDioFactory>(() => DioFactoryImpl(
        
      ));
  final dio = await instance<IDioFactory>().getDio();

  instance.registerLazySingleton<ClientApi>(() => ClientApiImpl(
        dio: dio,
      ));

  instance.registerLazySingleton<AppRepository>(() => AppRepositoryImpl(
      networkInfo: instance(),
      appPreferences: instance(),
      clientApi: instance()));
}

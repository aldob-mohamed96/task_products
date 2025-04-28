import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:task_products/core/network/api.dart';
import 'package:task_products/core/network/dio_factory.dart';
import 'package:task_products/core/resources_manager/constant.dart';
import 'package:task_products/core/service/app_preferance.dart';
import 'package:task_products/core/service/network_info.dart';
import 'package:task_products/core/widgets/show_dialog_snackbar.dart';
import 'package:task_products/features/auth/data/data_source/local_data_source/local_data_source.dart';
import 'package:task_products/features/auth/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:task_products/features/auth/data/repository_impl/auth_repository_impl.dart';
import 'package:task_products/features/auth/domain/repository/auth_repository.dart';
import 'package:task_products/features/auth/domain/usecase/change_authentication_usecase.dart';
import 'package:task_products/features/auth/domain/usecase/get_authentication_usecase.dart';
import 'package:task_products/features/auth/domain/usecase/login_usecase.dart';
import 'package:task_products/features/auth/domain/usecase/logout_usecase.dart';
import 'package:task_products/features/auth/presentation/logic/authentication/authentication_cubit.dart';
import 'package:task_products/features/auth/presentation/logic/login/login_cubit.dart';
import 'package:task_products/features/cart/data/data_source/local_data_source/local_data_source.dart';
import 'package:task_products/features/cart/data/repositories_impl/cart_repository_impl.dart';
import 'package:task_products/features/cart/data/response/cart_response.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task_products/features/cart/domain/repositories/cart_repository.dart';
import 'package:task_products/features/cart/domain/usecase/add_item_cart_usecase.dart';
import 'package:task_products/features/cart/domain/usecase/clear_cart_usecase.dart';
import 'package:task_products/features/cart/domain/usecase/delete_item_cart_usecase.dart';
import 'package:task_products/features/cart/domain/usecase/get_all_items_cart_usecase.dart';
import 'package:task_products/features/cart/domain/usecase/get_cart_count_usecase.dart';
import 'package:task_products/features/cart/domain/usecase/get_item_cart_usecase.dart';
import 'package:task_products/features/cart/domain/usecase/update_item_cart_usecase.dart';
import 'package:task_products/features/cart/presentation/logic/cart/cart_cubit.dart';

final instance = GetIt.instance;
Future<void> initAppServicesGetIt() async {
  await general();
}

Future<void> general() async {
  // local storage
  await hiveFactory();
  //internet connection
  instance.registerLazySingleton(() => InternetConnection());
  instance.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(internetConnectionChecker: instance()),
  );

  instance.registerLazySingleton<AppPreferences>(() => AppPreferencesImpl());
  // remote
  instance.registerLazySingleton<IDioFactory>(() => DioFactoryImpl());
  final dio = await instance<IDioFactory>().getDio();

  instance.registerLazySingleton<ClientApi>(() => ClientApiImpl(dio: dio));

  authenticationFactory();
}

Future<void> hiveFactory() async {
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(CartItemAdapter());
  await Hive.openBox(AppConstants.hiveBoxUser);
  await Hive.openBox(AppConstants.hiveCartBox);
}

void authenticationFactory() async {
  instance.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(appPreferences: instance()),
  );
  instance.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(clientApi: instance()),
  );

  instance.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      networkInfo: instance(),
      authRemoteDataSource: instance(),
      authLocalDataSource: instance(),
    ),
  );

  instance.registerLazySingleton<GetAuthenticationUsecase>(
    () => GetAuthenticationUsecase(repository: instance()),
  );

  instance.registerLazySingleton<ChangeAuthenticationUsecase>(
    () => ChangeAuthenticationUsecase(repository: instance()),
  );
  instance.registerLazySingleton<LogOutUseCase>(
    () => LogOutUseCase(repository: instance()),
  );

  instance.registerLazySingleton<AuthenticationCubit>(
    () => AuthenticationCubit(
      getAuthenticationUsecase: instance(),
      changeAuthenticationUsecase: instance(),
      logOutUseCase: instance(),
    ),
  );

  instance.registerLazySingleton<IShowAlertMessage>(
    () => ShowAlertMessageImpl(),
  );
}

void loginFactory() async {
  if (!instance.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(
      () => LoginUseCase(repository: instance()),
    );
  }

  if (!instance.isRegistered<LoginCubit>()) {
    instance.registerFactory<LoginCubit>(
      () => LoginCubit(loginUseCase: instance()),
    );
  }
}

void cartFactory() async {
  if (!instance.isRegistered<CartLocalDataSource>()) {
    instance.registerFactory<CartLocalDataSource>(
      () => CartLocalDataSourceImpl(appPreferences: instance()),
    );
  }

  // local
  if (!instance.isRegistered<CartRepository>()) {
    instance.registerFactory<CartRepository>(
      () => CartRepositoryImpl(localDataSource: instance()),
    );
  }

  //addItemToCartUseCase
  if (!instance.isRegistered<AddItemToCartUseCase>()) {
    instance.registerFactory<AddItemToCartUseCase>(
      () => AddItemToCartUseCase(repository: instance()),
    );
  }
  //deleteItemFromCartUseCase
  if (!instance.isRegistered<DeleteItemFromCartUseCase>()) {
    instance.registerFactory<DeleteItemFromCartUseCase>(
      () => DeleteItemFromCartUseCase(repository: instance()),
    );
  }

  if (!instance.isRegistered<GetAllItemsFromCartUseCase>()) {
    instance.registerFactory<GetAllItemsFromCartUseCase>(
      () => GetAllItemsFromCartUseCase(repository: instance()),
    );
  }

  if (!instance.isRegistered<GetItemFromCartUseCase>()) {
    instance.registerFactory<GetItemFromCartUseCase>(
      () => GetItemFromCartUseCase(repository: instance()),
    );
  }

  if (!instance.isRegistered<ClearCartUseCase>()) {
    instance.registerFactory<ClearCartUseCase>(
      () => ClearCartUseCase(repository: instance()),
    );
  }

  if (!instance.isRegistered<GetCartCountsUseCase>()) {
    instance.registerFactory<GetCartCountsUseCase>(
      () => GetCartCountsUseCase(repository: instance()),
    );
  }

  if (!instance.isRegistered<UpdateItemCartUseCase>()) {
    instance.registerFactory<UpdateItemCartUseCase>(
      () => UpdateItemCartUseCase(repository: instance()),
    );
  }

  if (!instance.isRegistered<CartCubit>()) {
    instance.registerFactory<CartCubit>(
      () => CartCubit(
        addItemToCartUseCase: instance(),
        deleteItemFromCartUseCase: instance(),
        getAllItemsFromCartUseCase: instance(),
        getItemFromCartUseCase: instance(),
        clearCartUseCase: instance(),
        getCartCountsUseCase: instance(),
        updateItemCartUseCase: instance(),
      ),
    );
  }
}

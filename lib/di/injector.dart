import 'package:flutter_burger_land/data/repository/order_repository.dart';
import 'package:flutter_burger_land/data/repository/order_repository_impl.dart';
import 'package:flutter_burger_land/data/services/auth_service.dart';
import 'package:flutter_burger_land/data/services/firestore_service.dart';
import 'package:flutter_burger_land/data/services/geo_service.dart';
import 'package:flutter_burger_land/data/repository/auth_repository.dart';
import 'package:flutter_burger_land/data/repository/auth_repository_impl.dart';
import 'package:flutter_burger_land/data/repository/food_repository_impl.dart';
import 'package:flutter_burger_land/data/repository/food_repository.dart';
import 'package:flutter_burger_land/data/repository/location_repository.dart';
import 'package:flutter_burger_land/data/repository/location_repository_impl.dart';
import 'package:flutter_burger_land/data/repository/user_data_repository.dart';
import 'package:flutter_burger_land/data/repository/user_data_repository_impl.dart';
import 'package:flutter_burger_land/domain/add_order_uc.dart';
import 'package:flutter_burger_land/domain/add_user_data_uc.dart';
import 'package:flutter_burger_land/domain/create_user_uc.dart';
import 'package:flutter_burger_land/domain/get_food_uc.dart';
import 'package:flutter_burger_land/domain/get_location_uc.dart';
import 'package:flutter_burger_land/domain/get_user_data_uc.dart';
import 'package:flutter_burger_land/domain/sign_in_uc.dart';
import 'package:flutter_burger_land/presentation/providers/auth_provider.dart';
import 'package:flutter_burger_land/presentation/providers/food_provider.dart';
import 'package:flutter_burger_land/presentation/providers/location_provider.dart';
import 'package:flutter_burger_land/presentation/providers/order_provider.dart';
import 'package:flutter_burger_land/presentation/providers/user_data_provider.dart';
import 'package:get_it/get_it.dart';

final _injector = GetIt.instance;

void setUp() {
  _injector.registerLazySingleton<FirestoreService>(() => FirestoreService());
  _injector.registerLazySingleton<FoodRepository>(
      () => FoodRepositoryImpl(_injector<FirestoreService>()));

  _injector.registerLazySingleton<FoodProvider>(
      () => FoodProvider(_injector<GetFoodUC>()));

  _injector.registerLazySingleton<GetFoodUC>(
      () => GetFoodUC(_injector<FoodRepository>()));

  _injector.registerLazySingleton<GeoService>(() => GeoService());
  _injector.registerLazySingleton<LocationRepository>(
      () => LocationRepositoryImpl(_injector<GeoService>()));

  _injector.registerLazySingleton<LocationProvider>(
      () => LocationProvider(_injector<GetLocationUC>()));

  _injector.registerLazySingleton<GetLocationUC>(
      () => GetLocationUC(_injector<LocationRepository>()));

  _injector.registerLazySingleton<UserDataRepository>(
      () => UserDataRepositoryImpl(_injector<FirestoreService>()));

  _injector.registerLazySingleton<GetUserDataUC>(
      () => GetUserDataUC(_injector<UserDataRepository>()));

  _injector.registerLazySingleton<AddUserDataUC>(
      () => AddUserDataUC(_injector<UserDataRepository>()));
  _injector.registerLazySingleton<UserDataProvider>(() =>
      UserDataProvider(_injector<GetUserDataUC>(), _injector<AddUserDataUC>()));

  _injector.registerLazySingleton<AuthService>(() => AuthService());

  _injector.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(_injector<AuthService>()));

  _injector.registerLazySingleton<CreateUserUC>(
      () => CreateUserUC(_injector<AuthRepository>()));

  _injector.registerLazySingleton<SignInUC>(
      () => SignInUC(_injector<AuthRepository>()));

  _injector.registerLazySingleton<AuthProvider>(
      () => AuthProvider(_injector<CreateUserUC>(), _injector<SignInUC>()));

  _injector.registerLazySingleton<OrderRepository>(
      () => OrderRepositoryImpl(_injector<FirestoreService>()));

  _injector.registerLazySingleton<AddOrderUC>(
      () => AddOrderUC(_injector<OrderRepository>()));

  _injector.registerLazySingleton<OrderProvider>(
      () => OrderProvider(_injector<AddOrderUC>()));
}

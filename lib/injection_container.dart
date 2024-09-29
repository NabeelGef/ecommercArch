import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/network/network_info.dart';
import 'feature/auth/login/data/datasource/LoginRemoteDataSource.dart';
import 'feature/auth/login/data/repositories/login_repo.dart';
import 'feature/auth/login/domain/usecases/login_usecase.dart';
import 'feature/auth/login/presentation/bloc/login_bloc.dart';
import 'feature/auth/profile/data/datasource/profile_local_datasource.dart';
import 'feature/auth/profile/data/datasource/profile_remote_datasource.dart';
import 'feature/auth/profile/data/repositories/profileRepo.dart';
import 'feature/auth/profile/domain/usecases/getProfile.dart';
import 'feature/auth/profile/presentation/bloc/profile_cubit.dart';
import 'feature/auth/signup/data/datasource/signup_remot_datasource.dart';
import 'feature/auth/signup/data/repositories/signup_repo.dart';
import 'feature/auth/signup/domain/usecases/signup_usecases.dart';
import 'feature/auth/signup/presentation/bloc/signup_cubit.dart';
import 'feature/home/data/datasource/home_local_data_source.dart';
import 'feature/home/data/datasource/home_remote_data_source.dart';
import 'feature/home/data/repositories/home_repositories_impl.dart';
import 'feature/home/domain/usecases/getAllSliders.dart';
import 'feature/home/domain/usecases/get_all_categories.dart';
import 'feature/home/domain/usecases/getall_mostsale.dart';
import 'feature/home/presentation/bloc/home_cubit.dart';
import 'feature/order/data/datasource/orders_home_datasource.dart';
import 'feature/order/data/datasource/orders_remot_datasource.dart';
import 'feature/order/data/repositories/order_repositories.dart';
import 'feature/order/domain/usecases/order_usecases.dart';
import 'feature/order/presentation/bloc/orders_cubit.dart';
import 'feature/product/data/datasource/products_local_data_source.dart';
import 'feature/product/data/datasource/products_remote_data_source.dart';
import 'feature/product/data/repositories/proudcts_repositories.dart';
import 'feature/product/domain/usecases/get_all_product.dart';
import 'feature/product/domain/usecases/get_single_products.dart';
import 'feature/product/presentation/bloc/products_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
//Feature - home =========================================

//Bloc : ====================>
  sl.registerFactory(() => HomeCubit(
      getAllSlidersUseCase: sl(),
      getAllMostSaleUseCase: sl(),
      getAllCategoriesUseCase: sl()));

  //UseCase : =================>
  sl.registerLazySingleton(() => GetAllCategories(sl()));
  sl.registerLazySingleton(() => GetAllSliders(sl()));
  sl.registerLazySingleton(() => GetAllMostSale(sl()));

  //Repository:================>
  sl.registerLazySingleton(() => HomeRepositoriesImpl(
      homeLocalDataSource: sl(),
      homeRemoteDataSource: sl(),
      networkInfo: sl()));

  //DataSource :===============>
  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl());
  sl.registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSourceImpl());

// Feature - product======================================
  //Bloc : ====================>
  sl.registerFactory(() => ProductsCubit(
        getSingleProductsUseCase: sl(),
        getAllProductsUseCase: sl(),
      ));

  //UseCase : =================>
  sl.registerLazySingleton(() => GetAllProducts(sl()));
  sl.registerLazySingleton(() => GetSingleProducts(sl()));

  //Repository:================>
  sl.registerLazySingleton(() => ProductsRepositoriesImpl(
      productsLocalDataSource: sl(),
      productsRemoteDataSource: sl(),
      networkInfo: sl()));

  //DataSource :===============>
  sl.registerLazySingleton<ProductsRemoteDataSource>(
      () => ProductsRemoteDataSourceImpl());
  sl.registerLazySingleton<ProductsLocalDataSource>(
      () => ProductsLocalDataSourceImpl());

  // Feature - Signup==========================================
  //Bloc : ====================>
  sl.registerFactory(() => SignupCubit(
        signupUseCase: sl(),
      ));

  //UseCase : =================>
  sl.registerLazySingleton(() => SignupUseCase(sl()));

  //Repository:================>
  sl.registerLazySingleton(() => SignupRepositoriesImpl(
        signupRemoteDataSourceImpl: sl(),
        networkInfo: sl(),
      ));

  //DataSource :===============>
  sl.registerLazySingleton<SignupRemoteDataSource>(
      () => SignupRemoteDataSourceImpl());

  // Feature - Login
  //Bloc : ====================>
  sl.registerFactory(() => LoginCubit(
        loginUseCase: sl(),
      ));

  //UseCase : =================>
  sl.registerLazySingleton(() => LoginUseCase(sl()));

  //Repository:================>
  sl.registerLazySingleton(() => LoginRepositoriesImpl(
        loginRemoteDataSourceImpl: sl(),
        networkInfo: sl(),
      ));

  //DataSource :===============>
  sl.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl());

  // Feature - Orders======================================
  //Bloc : ====================>
  sl.registerFactory(() => OrdersCubit(
        orderUseCase: sl(),
      ));

  //UseCase : =================>
  sl.registerLazySingleton(() => OrderUseCase(sl()));

  //Repository:================>
  sl.registerLazySingleton(() => OrdersRepositoriesImpl(
      ordersLocalDataSourceImpl: sl(),
      ordersRemoteDataSourceImpl: sl(),
      networkInfo: sl()));

  //DataSource :===============>
  sl.registerLazySingleton<OrdersRemoteDataSource>(
      () => OrdersRemoteDataSourceImpl());
  sl.registerLazySingleton<OrdersLocalDataSource>(
      () => OrdersLocalDataSourceImpl());
  // Feature - Profile======================================
  //Bloc : ====================>
  sl.registerFactory(() => ProfileCubit(
        profileUseCase: sl(), addAddressUseCase: sl(),
      ));

  //UseCase : =================>
  sl.registerLazySingleton(() => ProfileUseCase(sl()));

  //Repository:================>
  sl.registerLazySingleton(() => ProfileRepo(
      profileLocalDataSource: sl(),
      profileRemoteDataSource: sl(),
      networkInfo: sl()));

  //DataSource :===============>
  sl.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImpl());
  sl.registerLazySingleton<ProfileLocalDataSource>(
      () => ProfileLocalDataSourceImpl());

  //=================================================

//Core : ====================>
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//External : ================>
  sl.registerLazySingleton(() => InternetConnectionChecker());
}

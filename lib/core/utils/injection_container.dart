import 'package:book_store/core/network/network_info.dart';
import 'package:book_store/feature/cart/data/data_sources/cart_remote_data_source.dart';
import 'package:book_store/feature/cart/data/repositories/cart_repository_impl.dart';
import 'package:book_store/feature/cart/domain/repositories/cart_repository.dart';
import 'package:book_store/feature/cart/domain/usecases/get_cart.dart';
import 'package:book_store/feature/cart/presentation/manager/cart_bloc.dart';
import 'package:book_store/feature/product/data/data_sources/product_remote_data_source.dart';
import 'package:book_store/feature/product/data/repositories/product_repository_impl.dart';
import 'package:book_store/feature/product/domain/repositories/product_repository.dart';
import 'package:book_store/feature/product/domain/usecases/get_product.dart';
import 'package:book_store/feature/product/presentation/manager/product_bloc.dart';
import 'package:book_store/feature/product_loai1/data/data_sources/product1_remote_data_source.dart';
import 'package:book_store/feature/product_loai1/data/repositories/product1_repository_impl.dart';
import 'package:book_store/feature/product_loai1/domain/repositories/product1_repository.dart';
import 'package:book_store/feature/product_loai1/domain/usecases/get_product1.dart';
import 'package:book_store/feature/product_loai1/presentation/manager/product1_bloc.dart';
import 'package:book_store/feature/product_loai2/data/data_sources/product2_remote_data_source.dart';
import 'package:book_store/feature/product_loai2/data/repositories/product2_repository_impl.dart';
import 'package:book_store/feature/product_loai2/domain/repositories/product2_repository.dart';
import 'package:book_store/feature/product_loai2/domain/usecases/get_product2.dart';
import 'package:book_store/feature/product_loai2/presentation/manager/product2_bloc.dart';
import 'package:book_store/feature/product_loai3/data/data_sources/product3_remote_data_source.dart';
import 'package:book_store/feature/product_loai3/data/repositories/product3_repository_impl.dart';
import 'package:book_store/feature/product_loai3/domain/repositories/product3_repository.dart';
import 'package:book_store/feature/product_loai3/domain/usecases/get_product3.dart';
import 'package:book_store/feature/product_loai3/presentation/manager/product3_bloc.dart';
import 'package:book_store/feature/product_loai4/data/data_sources/product4_remote_data_source.dart';
import 'package:book_store/feature/product_loai4/data/repositories/product4_repository_impl.dart';
import 'package:book_store/feature/product_loai4/domain/repositories/product4_repository.dart';
import 'package:book_store/feature/product_loai4/domain/usecases/get_product4.dart';
import 'package:book_store/feature/product_loai4/presentation/manager/product4_bloc.dart';
import 'package:book_store/feature/product_loai5/data/data_sources/product5_remote_data_source.dart';
import 'package:book_store/feature/product_loai5/data/repositories/product5_repository_impl.dart';
import 'package:book_store/feature/product_loai5/domain/repositories/product5_repository.dart';
import 'package:book_store/feature/product_loai5/domain/usecases/get_product5.dart';
import 'package:book_store/feature/product_loai5/presentation/manager/product5_bloc.dart';
import 'package:book_store/feature/product_loai6/data/data_sources/product6_remote_data_source.dart';
import 'package:book_store/feature/product_loai6/data/repositories/product6_repository_impl.dart';
import 'package:book_store/feature/product_loai6/domain/repositories/product6_repository.dart';
import 'package:book_store/feature/product_loai6/domain/usecases/get_product6.dart';
import 'package:book_store/feature/product_loai6/presentation/manager/product6_bloc.dart';
import 'package:book_store/feature/product_loai7/data/data_sources/product7_remote_data_source.dart';
import 'package:book_store/feature/product_loai7/data/repositories/product7_repository_impl.dart';
import 'package:book_store/feature/product_loai7/domain/repositories/product7_repository.dart';
import 'package:book_store/feature/product_loai7/domain/usecases/get_product7.dart';
import 'package:book_store/feature/product_loai7/presentation/manager/product7_bloc.dart';
import 'package:book_store/feature/profile/data/data_sources/profile_local_data_source.dart';
import 'package:book_store/feature/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:book_store/feature/profile/data/repositories/profile_repository_impl.dart';
import 'package:book_store/feature/profile/domain/repositories/profile_repository.dart';
import 'package:book_store/feature/profile/domain/usecases/get_current_profile.dart';
import 'package:book_store/feature/profile/domain/usecases/get_profile.dart';
import 'package:book_store/feature/profile/presentation/manager/profile_bloc.dart';
import 'package:book_store/feature/sign_in/data/data_sources/login_local_data_source.dart';
import 'package:book_store/feature/sign_in/data/data_sources/login_remote_data_source.dart';
import 'package:book_store/feature/sign_in/data/repositories/login_repository_impl.dart';
import 'package:book_store/feature/sign_in/domain/repositories/login_repository.dart';
import 'package:book_store/feature/sign_in/domain/usecases/get_current_user.dart';
import 'package:book_store/feature/sign_in/domain/usecases/post_login.dart';
import 'package:book_store/feature/sign_in/presentation/manager/login_bloc.dart';
import 'package:book_store/feature/sign_up/data/data_sources/register_remote_data_source.dart';
import 'package:book_store/feature/sign_up/data/repositories/register_repository_impl.dart';
import 'package:book_store/feature/sign_up/domain/repositories/register_repository.dart';
import 'package:book_store/feature/sign_up/domain/usecases/post_register.dart';
import 'package:book_store/feature/sign_up/presentation/manager/register_bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  ///
  //login
  sl.registerFactory(
    () => LoginBloc(
      lg: sl(),
      cu: sl(),
    ),
  );
  //register
  sl.registerFactory(() => RegisterBloc(lg: sl()));
  //product
  sl.registerLazySingleton(() => ProductBloc(pr: sl()));

  //product1
  sl.registerLazySingleton(() => Product1Bloc(pr: sl()));
  //product2
  sl.registerLazySingleton(() => Product2Bloc(pr: sl()));
  //product3
  sl.registerLazySingleton(() => Product3Bloc(pr: sl()));
  //product4
  sl.registerLazySingleton(() => Product4Bloc(pr: sl()));
  //product5
  sl.registerLazySingleton(() => Product5Bloc(pr: sl()));
  //product6
  sl.registerLazySingleton(() => Product6Bloc(pr: sl()));
  //product7
  sl.registerLazySingleton(() => Product7Bloc(pr: sl()));

  //cart
  sl.registerLazySingleton(() => CartBloc(pr: sl()));
  //profile
  sl.registerLazySingleton(() => ProfileBloc(pr: sl(),cu: sl()));


  ///use case
  //login
  sl.registerLazySingleton(() => PostLogin(loginRepository: sl()));
  sl.registerLazySingleton(() => GetCurrentUser(loginRepository: sl()));

  //register
  sl.registerLazySingleton(() => PostRegister(registerRepository: sl()));
  //product
  sl.registerLazySingleton(() => GetProduct(sl()));
  //product1
  sl.registerLazySingleton(() => GetProduct1(sl()));
  //product2
  sl.registerLazySingleton(() => GetProduct2(sl()));
  //product3
  sl.registerLazySingleton(() => GetProduct3(sl()));
  //product4
  sl.registerLazySingleton(() => GetProduct4(sl()));
  //product5
  sl.registerLazySingleton(() => GetProduct5(sl()));
  //product6
  sl.registerLazySingleton(() => GetProduct6(sl()));
  //product7
  sl.registerLazySingleton(() => GetProduct7(sl()));
  //cart
  sl.registerLazySingleton(() => GetCart(sl()));
  //profile
  sl.registerLazySingleton(() => GetProfile(sl()));
  sl.registerLazySingleton(() => GetCurrentProfile(profileRepository:  sl()));


  ///repo
  //login
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(
      networkInfo: sl(),
      loginLocalDataSource: sl(),
      loginRemoteDataSource: sl()));
  //register
  sl.registerLazySingleton<RegisterRepository>(() => RegisterRepositoryImpl(
      networkInfo: sl(), registerRemoteDataSource: sl()));
  //product
  sl.registerLazySingleton<ProductRepository>(() =>
      ProductRepositoryImpl(networkInfo: sl(), productRemoteDataSource: sl()));

  //product1
  sl.registerLazySingleton<Product1Repository>(() => Product1RepositoryImpl(
      networkInfo: sl(), product1RemoteDataSource: sl()));
  //product2
  sl.registerLazySingleton<Product2Repository>(() => Product2RepositoryImpl(
      networkInfo: sl(), product2RemoteDataSource: sl()));
  //product3
  sl.registerLazySingleton<Product3Repository>(() => Product3RepositoryImpl(
      networkInfo: sl(), product3RemoteDataSource: sl()));
  //product4
  sl.registerLazySingleton<Product4Repository>(() => Product4RepositoryImpl(
      networkInfo: sl(), product4RemoteDataSource: sl()));
  //product5
  sl.registerLazySingleton<Product5Repository>(() => Product5RepositoryImpl(
      networkInfo: sl(), product5RemoteDataSource: sl()));
  //product6
  sl.registerLazySingleton<Product6Repository>(() => Product6RepositoryImpl(
      networkInfo: sl(), product6RemoteDataSource: sl()));
  //product7
  sl.registerLazySingleton<Product7Repository>(() => Product7RepositoryImpl(
      networkInfo: sl(), product7RemoteDataSource: sl()));

  //cart
  sl.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(networkInfo: sl(), cartRemoteDataSource: sl()));
  //profile
  sl.registerLazySingleton<ProfileRepository>(() =>
      ProfileRepositoryImpl(networkInfo: sl(), profileRemoteDataSource: sl(),profileLocalDataSource: sl()));

  ///data source
  //login
  sl.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<LoginLocalDataSource>(
      () => LoginLocalDataSourceImpl(sharedPreferences: sl()));
  //register
  sl.registerLazySingleton<RegisterRemoteDataSource>(
      () => RegisterRemoteDataSourceImpl(client: sl()));
  //product
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(client: sl()));
  //product1
  sl.registerLazySingleton<Product1RemoteDataSource>(
      () => Product1RemoteDataSourceImpl(client: sl()));
  //product2
  sl.registerLazySingleton<Product2RemoteDataSource>(
      () => Product2RemoteDataSourceImpl(client: sl()));
  //product3
  sl.registerLazySingleton<Product3RemoteDataSource>(
      () => Product3RemoteDataSourceImpl(client: sl()));
  //product4
  sl.registerLazySingleton<Product4RemoteDataSource>(
      () => Product4RemoteDataSourceImpl(client: sl()));
  //product5
  sl.registerLazySingleton<Product5RemoteDataSource>(
          () => Product5RemoteDataSourceImpl(client: sl()));
  //product6
  sl.registerLazySingleton<Product6RemoteDataSource>(
          () => Product6RemoteDataSourceImpl(client: sl()));
  //product7
  sl.registerLazySingleton<Product7RemoteDataSource>(
          () => Product7RemoteDataSourceImpl(client: sl()));
  //cart
  sl.registerLazySingleton<CartRemoteDataSource>(
      () => CartRemoteDataSourceImpl(client: sl()));
  //profile
  sl.registerLazySingleton<ProfileRemoteDataSource>(
          () => ProfileRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<ProfileLocalDataSource>(
          () => ProfileLocalDataSourceImpl(sharedPreferences: sl()));

  ///core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  ///external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}

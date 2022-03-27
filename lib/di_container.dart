import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/utill/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/datasource/remote/dio/dio_client.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';
import 'data/repository/repo/auth_repo/auth_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {

  sl.registerLazySingleton(() => DioClient(AppConstants.baseUrl, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));
  // Repository
  sl.registerLazySingleton(() => AuthRepo(dioClient: sl()));

  ///// provider //////
  sl.registerFactory(() => AuthProvider(authRepo: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}
import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:erp_app/core/network/dio_client.dart';
import 'package:erp_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:erp_app/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:erp_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:erp_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:erp_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:erp_app/features/settings/presentation/bloc/theme_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  sl.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());

  // Core
  sl.registerLazySingleton<DioClient>(() => DioClient());

  // Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sl()));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sl(), sl()));

  // Bloc
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl()));
  sl.registerLazySingleton<ThemeBloc>(() => ThemeBloc());
}

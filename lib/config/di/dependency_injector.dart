import 'package:bloodsearchapp/config/theme/cubit/theme_cubit.dart';
import 'package:bloodsearchapp/features/auth/data/datasources/auth_remote.dart';
import 'package:bloodsearchapp/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:bloodsearchapp/features/auth/domain/repositories/auth_repository.dart';
import 'package:bloodsearchapp/features/auth/domain/usecases/auth_usecase.dart';
import 'package:bloodsearchapp/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:bloodsearchapp/features/auth/presentation/cubit/registation/registation_cubit.dart';
import 'package:bloodsearchapp/features/auth/presentation/cubit/otp_verify/otp_verify_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> configureDependencies() async {
  await _appTheme();
  await _auth();
}

Future<void> _appTheme() async {
  sl.registerFactory(() => ThemeCubit());
}

Future<void> _auth() async {
  sl.registerFactory<LoginCubit>(() => LoginCubit(authUseCase: sl()));
  sl.registerFactory<RegistationCubit>(
      () => RegistationCubit(authUseCase: sl()));
  sl.registerFactory<OtpVerifyCubit>(() => OtpVerifyCubit(authUseCase: sl()));

  // Auth use-case
  sl.registerLazySingleton(() => AuthUseCase(
        authRepository: sl(),
      ));
  // Register : Add your Register here
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authRemoteServices: sl()));
  // Register : Add your data sources here
  sl.registerLazySingleton(() => AuthRemoteServices());
}

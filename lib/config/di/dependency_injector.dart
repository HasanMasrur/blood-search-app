import 'package:bloodsearchapp/config/theme/cubit/theme_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> configureDependencies() async {
  await _appTheme();
}

Future<void> _appTheme() async {
  sl.registerFactory(() => ThemeCubit());
}

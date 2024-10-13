import 'package:bloodsearchapp/config/di/dependency_injector.dart';
import 'package:bloodsearchapp/config/theme/cubit/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

class StateManagementProviders {
  static List<SingleChildWidget> providers = [
    BlocProvider(create: (context) => sl<ThemeCubit>()),
  ];
}

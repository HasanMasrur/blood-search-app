import 'package:bloodsearchapp/config/const/app/app_constant.dart';
import 'package:bloodsearchapp/config/const/app/state_management_provider.dart';
import 'package:bloodsearchapp/config/di/dependency_injector.dart';
import 'package:bloodsearchapp/config/navigation/app_route.dart';
import 'package:bloodsearchapp/config/navigation/route_name.dart';
import 'package:bloodsearchapp/config/theme/app_theme.dart';
import 'package:bloodsearchapp/config/theme/cubit/theme_cubit.dart';
import 'package:bloodsearchapp/config/theme/cubit/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //---AppRoute
  final AppRouter router = AppRouter();
  //---Dependencies-Injection
  await configureDependencies();
  //## ---Hydrated Bloc---
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Locks the app to portrait mode
  ]).then((_) {
    runApp(MultiBlocProvider(
        providers: StateManagementProviders.providers,
        child: MyApp(
          router: router,
        )));
    //  analyticsObserver: observer,
  });
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    required this.router,
  });
  final AppRouter router;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //  AwesomeNotifications().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            final textTheme = Theme.of(context).textTheme;
            return MaterialApp(
              title: AppConstants.appName,
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.system,
              navigatorKey: AppRouter.navigatorKey,
              theme: AppTheme.lightTheme(textTheme),
              darkTheme: AppTheme.darkTheme(textTheme),
              onGenerateRoute: widget.router.generateRoute,
              initialRoute: RouteName.launcherScreen,
              // home: LauncherScreen(),
            );
          },
        );
      },
    );
  }
}

import 'package:bloodsearchapp/config/const/app/app_assets.dart';
import 'package:bloodsearchapp/config/const/app/app_colors.dart';
import 'package:bloodsearchapp/config/navigation/route_name.dart';
import 'package:bloodsearchapp/config/ulilities/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LauncherScreen extends StatefulWidget {
  const LauncherScreen({super.key});

  @override
  LauncherScreenState createState() => LauncherScreenState();
}

class LauncherScreenState extends State<LauncherScreen> {
  @override
  void initState() {
    super.initState();

    afterNavigate();
  }

  Future<void> afterNavigate() async {
    await Future.delayed(const Duration(seconds: 3)).whenComplete(() async {
      await Navigator.pushReplacementNamed(context, RouteName.loginScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: context.isDarkMode ? AppColors.black : AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              AppAssets.bloodLogoPng,
              height: height * .5,
              width: width * .5,
            ).animate(
              effects: [
                const ScaleEffect(
                  duration: Duration(milliseconds: 500),
                  begin: Offset(10, 10),
                ),
                const ThenEffect(),
                const ShimmerEffect(),
                const ThenEffect(),
                const ShakeEffect(),
              ],
            ),
            const Spacer(),
            // Text(
            // //  "@Copyright ${AppConstants.appName}",
            //   style: Theme.of(context).textTheme.bodyMedium,
            // ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LauncherScreen extends StatefulWidget {
  const LauncherScreen({super.key});

  @override
  LauncherScreenState createState() => LauncherScreenState();
}

class LauncherScreenState extends State<LauncherScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),

            Spacer(),
            // Text(
            // //  "@Copyright ${AppConstants.appName}",
            //   style: Theme.of(context).textTheme.bodyMedium,
            // ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}


import 'package:digital_app/features/splash_&_onboarding/onboarding_screen/OnboardingScreen.dart';
import 'package:digital_app/features/splash_&_onboarding/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

import 'constants/app_constants.dart';
import 'helpers/di.dart';
import 'helpers/helper_methods.dart';
import 'networks/dio/dio.dart';



final class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool _isLoading = true;
  bool isFirstTime = false;

  @override
  void initState() {
    loadInitialData();
    super.initState();
  }

  loadInitialData() async {
    await Future.delayed(const Duration(seconds: 2));
    await setInitValue();

    bool isLoggedIn = appData.read(kKeyIsLoggedIn) ?? false;
    bool firstTime = appData.read(kKeyIsFirstTime)?? false;
    if (isLoggedIn) {
      String token = appData.read(kKeyAccessToken);
      DioSingleton.instance.update(token);
      Navigator.pushReplacement( context ,
        MaterialPageRoute(builder: (context) => Container()),
      );
    }
    else if (firstTime) {
      Navigator.pushReplacement( context ,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    }else {
      // Navigate to LoginScreen if not logged in
      // NavigationService.navigateToReplacement(Routes.loginScreen);
    }

    setState(() {
    });
  }




  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SplashScreen();
    } else {
      return appData.read(kKeyIsFirstTime)
          ? OnboardingScreen ()

          : const OnboardingScreen ();

    }
  }
}

import 'package:flutter/material.dart';
import 'package:movie_suggestions/onboarding-screen.dart';
import 'package:movie_suggestions/ui/screens/login_screen/login_screen.dart';
import 'package:movie_suggestions/ui/screens/register_screen/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final bool hasSeenOnboarding = await checkIfOnboardingSeen();
  runApp(MyApp(hasSeenOnboarding: hasSeenOnboarding));
}

Future<bool> checkIfOnboardingSeen() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('hasSeenOnboarding') ?? false;
}

class MyApp extends StatelessWidget {
  final bool hasSeenOnboarding;

  MyApp({required this.hasSeenOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:RegisterScreen.routeName ,
      routes: {
        OnboardingScreens.routeName:(context)=>OnboardingScreens(),
        LoginScreen.routeName:(context)=>LoginScreen(),
        RegisterScreen.routeName:(context)=>RegisterScreen(),
      },

    );
  }
}

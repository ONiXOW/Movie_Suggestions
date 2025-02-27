import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_suggestions/ui/onboard%20screen/onboarding-screen.dart';
import 'package:movie_suggestions/ui/screens/home_screen/home_screen.dart';
import 'package:movie_suggestions/ui/screens/login_screen/login_screen.dart';
import 'package:movie_suggestions/ui/screens/register_screen/register_screen.dart';
import 'package:movie_suggestions/ui/tabs/category_tab/category_tab.dart';
import 'package:movie_suggestions/ui/tabs/home_tab/home_tab.dart';
import 'package:movie_suggestions/ui/tabs/profile_tab/profile_tab.dart';
import 'package:movie_suggestions/ui/tabs/seearch_tab/search_tab.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'di/di.dart';


void main() async {
  configureDependencies();
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
      initialRoute:RegisterScreen.routeName,
      routes: {
        OnboardingScreens.routeName: (context) => OnboardingScreens(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        CategoryTab.routeName:(context)=>CategoryTab(),
        SearchTab.routeName:(context)=>SearchTab(),
        ProfileTab.routeName:(context)=>ProfileTab(),
      },
    );
  }
}

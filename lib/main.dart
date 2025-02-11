import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_suggestions/shared/cache_network.dart';
import 'package:movie_suggestions/ui/onboard%20screen/onboarding-screen.dart';
import 'package:movie_suggestions/ui/screens/auth_cubit/auth_cubit.dart';
import 'package:movie_suggestions/ui/screens/home_screen/home_screen.dart';
import 'package:movie_suggestions/ui/screens/login_screen/login_screen.dart';
import 'package:movie_suggestions/ui/screens/register_screen/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/constants.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final bool hasSeenOnboarding = await checkIfOnboardingSeen();
 await CacheNetwork.cacheInitialization();
 CacheNetwork.getCache(key: 'token');
 print ("token is $token");
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>AuthCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute:token!=null&& token!=''?HomeScreen.routeName:LoginScreen.routeName,
        routes: {
          OnboardingScreens.routeName:(context)=>OnboardingScreens(),
          LoginScreen.routeName:(context)=>LoginScreen(),
          RegisterScreen.routeName:(context)=>RegisterScreen(),
          HomeScreen.routeName:(context)=>HomeScreen(),
        },

      ),
    );
  }
}

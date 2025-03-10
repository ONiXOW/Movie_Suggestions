import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'core/bloc_observer.dart';
import 'core/helpers/local/cache_helper.dart';
import 'core/helpers/remote/dio_helper.dart';
import 'core/resources/app_localizations.dart';
import 'core/resources/color_manager.dart';
import 'features/Onboarding/ui/first_onboard_page.dart';
import 'features/Onboarding/ui/onboarding_pages.dart';
import 'features/Splash/splash_screen.dart';
import 'features/app_layout/logic/app_cubit.dart';
import 'features/app_layout/ui/pages/app_layout.dart';
import 'features/auth/data/api/login_api.dart';
import 'features/auth/data/api/register_api .dart';
import 'features/auth/data/repo/login_repo/login_repo_contract_impl.dart';
import 'features/auth/logic/login_cubit/log_in_cubit.dart';
import 'features/auth/logic/register_cubit/register_cubit.dart';
import 'features/edit_profile/data/api/reset_pass_api.dart';
import 'features/edit_profile/logic/change_password_cubit/change_password_cubit.dart';
import 'features/edit_profile/logic/edit_profile_cubit/edit_profile_cubit.dart';
import 'features/home_tab/logic/home_tab_cubit.dart';
import 'features/movie_details/logic/movie_details/movie_details_cubit.dart';
import 'features/movie_details/ui/movie_details.dart';
import 'features/profile_tab/data/Api/Api_profile-Tab.dart';
import 'features/profile_tab/logic/fav_cubit/user_fav__cubit.dart';
import 'features/profile_tab/logic/profile_cubit/profile_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  await CacheHelper.init();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeTabCubit()..getMoviesList()),
        BlocProvider(create: (context) => LogInCubit(loginRepo: LoginRepoContractImpl(LoginApiService()))),
        BlocProvider(create: (context) => RegisterCubit(apiService: RegisterApiService())),
        BlocProvider(create: (context) => ChangePasswordCubit(ResetPassApi())),
        BlocProvider(create: (context) => AppCubit()..getSavedLanguage()),
        BlocProvider(create: (context) => EditProfileCubit()),
        BlocProvider(create: (context) => MovieDetailsCubit()),
        BlocProvider(create: (context) => UserFavCubit()),
        BlocProvider(create: (context) => ProfileCubit(profileRepo: ProfileRepoImplementation())..fetchProfile()),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = AppCubit.get(context);
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            locale: cubit.locale,
            supportedLocales: const [
              Locale('ar'),
              Locale('en'),
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (deviceLocal, supportedLocales) {
              for (var locale in supportedLocales) {
                if (deviceLocal != null &&
                    deviceLocal.languageCode == locale.languageCode) {
                  return deviceLocal;
                }
              }
              return supportedLocales.first;
            },
            theme: ThemeData(
              scaffoldBackgroundColor: ColorManager.mainColor,
              textTheme: GoogleFonts.interTextTheme(),
              useMaterial3: true,
            ),
            home: SplashScreen(),
            routes: {
              SplashScreen.routeName: (context) => SplashScreen(),
              FirstOnboardPage.route: (context) => FirstOnboardPage(),
              OnboardingPages.route: (context) => OnboardingPages(),
              AppLayOut.routeName: (context) => AppLayOut(),
              //    EditProfileScreen.routeName: (context) => EditProfileScreen(),
              MovieDetails.routeName: (context) => MovieDetails(
                    movieId: 1,
                  ),
            },
          );
        },
      ),
    );
  }
}

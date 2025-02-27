import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:movie_suggestions/di/di.dart';
import 'package:movie_suggestions/ui/screens/home_screen/home_screen.dart';
import 'package:movie_suggestions/ui/screens/login_screen/cubit/login_states.dart';
import 'package:movie_suggestions/ui/screens/login_screen/cubit/login_view_model.dart';
import '../../../../widgets/animated_toggle.dart';
import '../../../../widgets/custome_elevated_button.dart';
import '../../../../widgets/text_field_widget.dart';
import '../../../core/cache/shared_preference_utils.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/dialog_utils.dart';
import '../register_screen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "Login_Screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool status = false;
  var isObscured = false;
  bool isLoading = false;
  LoginViewModel loginViewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocProvider<LoginViewModel>(
      create: (context) => loginViewModel,
      child: BlocListener<LoginViewModel, LoginStates>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            DialogUtils.showLoading(context: context, message: 'Waiting...');
          } else if (state is LoginErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
                context: context,
                message: state.failures.errorMessage,
                title: 'Error',
                posActionName: 'Ok');
          } else if (state is LoginSuccessState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
                context: context,
                message: 'Login Successfully',
                title: 'Success',
                posActionName: 'Ok',
                posAction: () {
                  //todo: save token
                  Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                });
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.blackColor,
          body: SingleChildScrollView(
            child: Form(
              key: loginViewModel.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: height * 0.08),
                      alignment: Alignment.center,
                      child: Image.asset(
                        AssetsManager.logoIcon,
                      )),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  TextFieldWidget(
                    controller: loginViewModel.mailController,
                    hintText: 'Email',
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please Enter Email';
                      }

                      bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(text);
                      if (!emailValid) {
                        return 'Please Enter Email Valid';
                      }
                    },
                    color: AppColors.greyColor,
                    prefixIcon: Image.asset(AssetsManager.emailIcon),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  TextFieldWidget(
                    hintText: 'Password',
                    obscureText: true,
                    color: AppColors.greyColor,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Please Enter Password";
                      }
                      if (text.length < 6) {
                        return "Password Should be at Least 6 chars";
                      }
                    },
                    controller: loginViewModel.passwordController,
                    prefixIcon: Image.asset(AssetsManager.passwordIcon),
                    sufixIcon: IconButton(
                      color: AppColors.whiteColor,
                      iconSize: 24,
                      onPressed: () {
                        isObscured = !isObscured;
                        setState(() {});
                      },
                      icon: Icon(
                          isObscured ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // todo: Navigation to Forget Password Screen
                    },
                    style: ElevatedButton.styleFrom(
                        iconColor: AppColors.blackColor,
                        foregroundColor: AppColors.transparentColor,
                        shadowColor: AppColors.transparentColor,
                        elevation: 0.0,
                        backgroundColor: AppColors.transparentColor),
                    child: Text(
                      'Forget Password?',
                      style: AppStyles.regular14Yellow,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CustomeElevatedButton(
                      text: 'Login',
                      onButton: () {
                        //! Login
                        loginViewModel.login();
                      }),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Center(
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: 'Don’t Have Account ?',
                          style: AppStyles.regular14White),
                      TextSpan(
                          text: 'Create One',
                          style: AppStyles.bold14Primary,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context)
                                  .pushNamed(RegisterScreen.routeName);
                            })
                    ])),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColors.primaryColor,
                          thickness: 2,
                          indent: 20,
                          endIndent: 20,
                        ),
                      ),
                      Text(
                        'Or',
                        style: AppStyles.regular14Yellow,
                      ),
                      Expanded(
                        child: Divider(
                          color: AppColors.primaryColor,
                          indent: 20,
                          endIndent: 20,
                          thickness: 2,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CustomeElevatedButton(
                    text: 'Login With Google',
                    onButton: () {
                      //todo: Login With Goggle
                    },
                    logoButton: Image.asset(AssetsManager.googleIcon),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  AnimatedToggle()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
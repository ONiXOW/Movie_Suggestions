import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:icons_plus/icons_plus.dart';

import 'package:flutter_switch/flutter_switch.dart';
import 'package:movie_suggestions/ui/screens/home_screen/home_screen.dart';
import 'package:movie_suggestions/ui/screens/login_screen/auth/AuthRemoteDataSource.dart';
import 'package:movie_suggestions/ui/screens/login_screen/auth/AuthRepostiory.dart';
import 'package:movie_suggestions/ui/screens/login_screen/auth/auth_remote_data_impl.dart';
import 'package:movie_suggestions/ui/screens/login_screen/auth/auth_repository_impl.dart';
import 'package:movie_suggestions/ui/screens/login_screen/auth/di.dart';
import 'package:movie_suggestions/ui/screens/login_screen/auth/login_use_case.dart';
import 'package:movie_suggestions/ui/screens/login_screen/auth/login_view_model.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../../../../utils/assets_manager.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

import '../../../../widgets/animated_toggle.dart';
import '../../../../widgets/custome_elevated_button.dart';
import '../../../../widgets/text_field_widget.dart';
import '../../../web_services/model/api_service.dart';
import '../register_screen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "Login_Screen";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool status = false;

  String language = 'ar';
  var isObscured = false;
  bool isLoading = false;
  LoginViewModel loginViewModel=getIt<LoginViewModel>();
  @override
  Widget build(BuildContext context) {

    final _controller = ValueNotifier<bool>(false);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocListener<LoginViewModel, LoginState>(
 bloc: loginViewModel,
  listener: (context, state) {
if(state is LoginLoadingState){
  Fluttertoast.showToast(
      msg: "Loading....",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);

}else if(state is LoginSuccessState){
  Fluttertoast.showToast(
      msg: "Login Successfully",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );

}else if(state is LoginErrorState){
  Fluttertoast.showToast(
      msg: state.error.errorMessage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
  },
  child: Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SingleChildScrollView(
        child:  Form(
          key:loginViewModel.formKey,
          child:Column(
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
                controller: loginViewModel.emailController,
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
                  text:    'Login',
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
                onButton: () {},
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
);
  }
}

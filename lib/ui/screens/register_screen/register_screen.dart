import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_suggestions/ui/screens/register_screen/auth_cubit/auth_cubit.dart';
import 'package:movie_suggestions/ui/screens/register_screen/auth_cubit/auth_state.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../../../../utils/assets_manager.dart';
import '../../../../widgets/animated_toggle.dart';
import '../../../../widgets/custome_elevated_button.dart';
import '../../../../widgets/text_field_widget.dart';
import '../home_screen/home_screen.dart';
import '../login_screen/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'Register_Screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  AuthCubit authCubit = AuthCubit();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            Fluttertoast.showToast(
                msg: "Successfully",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
            // Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          } else if (state is RegisterFailedState) {
            Fluttertoast.showToast(
                msg: "Register Field",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          } else if (state is RegisterLoadingState) {
            Fluttertoast.showToast(
                msg: "Loading....",
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
          appBar: AppBar(
            backgroundColor: AppColors.blackColor,
            title: Text(
              'Register',
              style: AppStyles.regular14Yellow,
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: authCubit.formKey,
              child: Column(
                children: [
                  SizedBox(height: height * 0.02),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          List.generate(authCubit.avatarList.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              authCubit.selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: width * 0.02),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: authCubit.selectedIndex == index
                                    ? Colors.yellow
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: authCubit.selectedIndex == index
                                  ? width * 0.1
                                  : height * 0.06,
                              backgroundImage:
                                  AssetImage(authCubit.avatarList[index]),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.06,
                  ),
                  TextFieldWidget(
                    hintText: 'Name',
                    controller: authCubit.nameController,
                    validator: (name) {
                      if (name == null || name.trim().isEmpty) {
                        return "Please Enter name";
                      }
                    },
                    prefixIcon: Icon(
                      Icons.contact_mail_outlined,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  TextFieldWidget(
                    hintText: 'Email',
                    controller: authCubit.emailController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Please Enter Email";
                      }
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(text);
                      if (!emailValid) {
                        return " Please Enter Valid Email";
                      }
                    },
                    prefixIcon: Image.asset(AssetsManager.emailIcon),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  TextFieldWidget(
                    hintText: 'Password',
                    controller: authCubit.passwordController,
                    validator: (password) {
                      if (password == null || password.trim().isEmpty) {
                        return "Please Enter Password";
                      }
                      if (password.length < 6) {
                        return "Password Should be at Least 6 chars";
                      }
                    },
                    obscureText: true,
                    sufixIcon: IconButton(
                      color: AppColors.whiteColor,
                      iconSize: 24,
                      onPressed: () {
                        authCubit.isObscured = !authCubit.isObscured;
                        setState(() {});
                      },
                      icon: Icon(authCubit.isObscured
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    prefixIcon: Image.asset(AssetsManager.passwordIcon),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  TextFieldWidget(
                      hintText: 'Confirm Password',
                      controller: authCubit.confirmPasswordController,
                      obscureText: false,
                      validator: (confirmPassword) {
                        if (confirmPassword == null ||
                            confirmPassword.trim().isEmpty) {
                          return "Please Confirm Password";
                        }
                        if (confirmPassword.length < 6) {
                          return "Password Should be at Least 6 chars";
                        }
                        if (confirmPassword !=
                            authCubit.passwordController.text) {
                          return "Confirm Password doesn’t Match Password";
                        }
                      },
                      prefixIcon: Image.asset(AssetsManager.passwordIcon),
                      sufixIcon: IconButton(
                        color: AppColors.whiteColor,
                        iconSize: 24,
                        onPressed: () {
                          authCubit.isObscured = !authCubit.isObscured;
                          setState(() {});
                        },
                        icon: Icon(authCubit.isObscured
                            ? Icons.visibility
                            : Icons.visibility_off),
                      )),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  TextFieldWidget(
                    hintText: 'Phone Number',
                    controller: authCubit.phoneController,
                    validator: (phone) {
                      if (phone == null || phone.trim().isEmpty) {
                        return "Please Enter Phone Number ";
                      }
                    },
                    keyBoardType: TextInputType.number,
                    prefixIcon: Image.asset(AssetsManager.phoneIcon),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  CustomeElevatedButton(
                      text: 'Create Account',
                      onButton: () {
                        //todo: Navigation to Login Screen ///////l///////////////////

                        if (authCubit.formKey.currentState!.validate()) {
                          authCubit.register();
                        }
                      }),
                  Center(
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: 'Already Have Account ?',
                          style: AppStyles.regular14White),
                      TextSpan(
                          text: ' Login',
                          style: AppStyles.bold14Primary,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context)
                                  .pushNamed(LoginScreen.routeName);
                            })
                    ])),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  AnimatedToggle()
                ],
              ),
            ),
          ),
        ));
  }
}

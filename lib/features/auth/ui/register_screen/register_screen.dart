import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../../core/components/components.dart';
import '../../../../core/customWidgets/custom_button.dart';
import '../../../../core/customWidgets/custom_text_form_feild.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/text_manager.dart';
import '../../../../core/resources/toasts.dart';
import '../../../../core/resources/validate_of_textfiled.dart';
import '../../logic/login_cubit/log_in_cubit.dart';
import '../../logic/register_cubit/register_cubit.dart';
import '../login_screen/login_screen.dart';
import '../widgets/build_text.dart';
import '../widgets/language_switcher_toggle.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register_screen';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    // seleImage = profileImages[currentIndex];

    var height = MediaQuery.of(context).size.height;
    var regCubit = context.read<RegisterCubit>();

    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterError) {
          Toasts.error(state.error, context);
        }
        if (state is RegisterSuccess) {
          Toasts.success("Register Sucess", context);
        }
        if (state is RegisterLoading) {}
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              surfaceTintColor: Colors.transparent,
              forceMaterialTransparency: true,
              iconTheme: IconThemeData(color: ColorManager.yellowColor),
              title: Text(
                'register'.tr,
                style: FontManager.robotoRegular16Yellow,
              ),
              backgroundColor: ColorManager.mainColor,
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: regCubit.profileImages.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            regCubit.currentIndex = index;
                            regCubit.seleImage = regCubit.profileImages[index];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                regCubit.profileImages[index],
                              ),
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: regCubit.currentIndex == index
                                  ? ColorManager.yellowColor
                                  : Colors.transparent,
                              width: 8,
                            ),
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: height * 0.18,
                      enlargeCenterPage: true,
                      viewportFraction: 0.36,
                    ),
                  ),
                  Form(
                    key: regCubit.regKey,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 17, right: 17, top: 10),
                      child: Column(
                        children: [
                          CustomTextFormFeild(
                            controller: regCubit.nameController,
                            validator: (val) =>
                                ValidateOfTextfiled.validateFullName(val),
                            style: FontManager.robotoRegular14White,
                            hintStyle: FontManager.robotoRegular14White,
                            prefixIcon: Icon(
                              Icons.person_pin_outlined,
                              color: ColorManager.primaryWhiteColor,
                              size: 30,
                            ),
                            hint: 'name'.tr,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          CustomTextFormFeild(
                            style: FontManager.robotoRegular14White,
                            hintStyle: FontManager.robotoRegular14White,
                            // validator: _validateEmail,
                            controller: regCubit.emailController,
                            validator: (val) =>
                                ValidateOfTextfiled.validateEmail(val),
                            hint: 'email'.tr,
                            prefixIcon: Icon(
                              Icons.email,
                              color: ColorManager.primaryWhiteColor,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          CustomTextFormFeild(
                            controller: regCubit.passwordController,
                            style: FontManager.robotoRegular14White,
                            hintStyle: FontManager.robotoRegular14White,
                            validator: (val) =>
                                ValidateOfTextfiled.validatePassword(val),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: ColorManager.primaryWhiteColor,
                              size: 30,
                            ),
                            hint: 'password'.tr,
                            obscureText: regCubit.obscureText1,
                            suffixIcon: IconButton(
                              icon: Icon(
                                regCubit.obscureText1
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: ColorManager.primaryWhiteColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  regCubit.obscureText1 =
                                      !regCubit.obscureText1;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          CustomTextFormFeild(
                            controller: regCubit.repasswordController,
                            style: FontManager.robotoRegular14White,
                            hintStyle: FontManager.robotoRegular14White,
                            validator: (val) =>
                                ValidateOfTextfiled.validateConfirmPassword(
                              val,
                              regCubit.passwordController.text,
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: ColorManager.primaryWhiteColor,
                              size: 30,
                            ),
                            hint: 'Confirm Password'.tr,
                            obscureText: regCubit.obscureText2,
                            suffixIcon: IconButton(
                              icon: Icon(
                                regCubit.obscureText2
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: ColorManager.primaryWhiteColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  regCubit.obscureText2 =
                                      !regCubit.obscureText2;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          CustomTextFormFeild(
                            controller: regCubit.phoneController,
                            validator: (val) =>
                                ValidateOfTextfiled.validatePhoneNumber(val),
                            style: FontManager.robotoRegular14White,
                            hintStyle: FontManager.robotoRegular14White,
                            prefixIcon: Icon(
                              Icons.phone,
                              color: ColorManager.primaryWhiteColor,
                              size: 30,
                            ),
                            hint: 'phone'.tr,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          CustomButton(
                              title: 'Create Account',
                              buttonColor: ColorManager.yellowColor,
                              textColor: ColorManager.blackColor,
                              isLoading: state is RegisterLoading,
                              onPressed: () {
                                print(regCubit.currentIndex);
                                regCubit.registervalid(
                                    context: context,
                                    loginCubit: context.read<LogInCubit>(),
                                    selectedImage: regCubit.currentIndex);
                              }),
                          SizedBox(
                            height: height * 0.02,
                          ),
                        ],
                      ),
                    ),
                  ),
                  buildtext(context, "Already Have Account ? ".tr,
                      "login".tr, MainAxisAlignment.center, () {
                    navigateWithFade(context, LoginScreen());
                  }),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  LanguageSwitchToggle(),
                  SizedBox(
                    height: height * 0.02,
                  )
                ],
              ),
            ));
      },
    );
  }
}

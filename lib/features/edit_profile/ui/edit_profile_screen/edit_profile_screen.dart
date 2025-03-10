import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/components.dart';
import '../../../../core/customWidgets/custom_button.dart';
import '../../../../core/customWidgets/custom_text_form_feild.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/text_manager.dart';
import '../../../../core/resources/toasts.dart';
import '../../../app_layout/logic/app_cubit.dart';
import '../../../auth/ui/login_screen/login_screen.dart';
import '../../logic/edit_profile_cubit/edit_profile_cubit.dart';
import '../reset_paswprd_screen/reset_password_screen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, required this.name, required this.phone});

  final String name;
  final String phone;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController nameController;

  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    phoneController = TextEditingController(  text: widget.phone.substring(2),);
  }

  EditProfileCubit viewModel = EditProfileCubit();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is DeleteAccountSuccess) {
          Toasts.success(state.successMessage, context);
          navigateWithFade(context, LoginScreen());
        } else if (state is DeleteAccountError) {
          Toasts.error(state.errorMessage, context);
        } else if (state is EditProfileSuccess) {
          Toasts.success(state.successMessage, context);
          Navigator.pop(context);
        } else if (state is EditProfileError) {
          Toasts.error(state.errorMessage, context);
        }
      },
      builder: (BuildContext context, state) {
        final editProfileCubit = EditProfileCubit.of(context);
        return Scaffold(
          appBar: AppBar(
              surfaceTintColor: Colors.transparent,
              forceMaterialTransparency: true,
              iconTheme: IconThemeData(color: ColorManager.yellowColor),
              title: TextButton(
                onPressed: () {
                  viewModel.pickAvatarBottomSheet(context);
                },
                child: Text(
                  'Pick Avatar',
                  style: FontManager.robotoRegular16Yellow,
                ),
              ),
              backgroundColor: ColorManager.mainColor,
              centerTitle: true),
          body: SingleChildScrollView(
            child: Form(
              key: editProfileCubit.formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 20,
                  children: [
                    Image.asset(
                      editProfileCubit.pickedAvatar,
                      height: 100,
                      width: 100,
                    ),
                    CustomTextFormFeild(
                      controller: nameController,
                      hint: "",
                      style: FontManager.robotoRegular20WhiteBlack,
                      hintStyle: FontManager.robotoRegular20WhiteBlack,
                      prefixIcon: Icon(
                        Icons.person,
                        color: ColorManager.primaryWhiteColor,
                        size: 30,
                      ),
                    ),
                    CustomTextFormFeild(
                      controller: phoneController,
                      hint: editProfileCubit.phone,
                      style: FontManager.robotoRegular20WhiteBlack,
                      hintStyle: FontManager.robotoRegular20WhiteBlack,
                      prefixIcon: Icon(
                        Icons.local_phone,
                        color: ColorManager.primaryWhiteColor,
                        size: 30,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          navigateWithFade(context, ResetPasswordScreen());
                        },
                        child: Text(
                          'Reset Password',
                          style: FontManager.interMedium36White.copyWith(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.18,
                    ),
                    CustomButton(
                      title: 'Delete Account',
                      buttonColor: ColorManager.redColor,
                      textColor: ColorManager.primaryWhiteColor,
                      onPressed: () {
                        AppCubit.get(context).changeBottomNavigationBarIndex(0);
                        editProfileCubit.deleteAccount(context);
                      },
                    ),
                    CustomButton(
                      title: 'Update Data',
                      buttonColor: ColorManager.yellowColor,
                      textColor: ColorManager.blackColor,
                      onPressed: () {
                        editProfileCubit.updateProfile(
                            nameController, phoneController);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

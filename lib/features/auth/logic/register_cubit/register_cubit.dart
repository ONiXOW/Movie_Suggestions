import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/api_endPoints.dart';
import '../../../../core/resources/asset_manager.dart';
import '../../data/api/register_api .dart';
import '../../data/model/registerDM.dart';
import '../login_cubit/log_in_cubit.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterApiService apiService;

  // Initialize controllers inside the constructor
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController repasswordController;
  late final TextEditingController nameController;
  late final TextEditingController phoneController;

  // GlobalKey<FormState> registerKey = GlobalKey();
  bool isLoading = false;

  RegisterCubit({required this.apiService}) : super(RegisterInitial()) {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    repasswordController = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();
  }
  final List<String> profileImages = [
    ImageAssets.profile1,
    ImageAssets.profile2,
    ImageAssets.profile3,
    ImageAssets.profile4,
    ImageAssets.profile5,
    ImageAssets.profile6,
    ImageAssets.profile7,
    ImageAssets.profile8,
    ImageAssets.profile9,
  ];
  int currentIndex = 0;
  String seleImage = "";
  bool obscureText1 = true;
  bool obscureText2 = true;
  GlobalKey<FormState> regKey = GlobalKey();
  static RegisterCubit get(context) => BlocProvider.of(context);

  Future<void> registerUser(
      {required int selectedImage,
      required LogInCubit loginCubit,
      required BuildContext context}) async {
    isLoading = true;
    emit(RegisterLoading());

    try {
      Data userData = Data(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        confirmPassword: repasswordController.text.trim(),
        name: nameController.text.trim(),
        phone: phoneController.text.trim(),
        avaterId: selectedImage,
      );
      // Debugging Step: Print request body
      User response = await apiService.register(
          endpoint: ApiEndPoints.register, userData: userData);
      if (response.data != null) {
        loginCubit.emailController.text = emailController.text.trim();
        loginCubit.passwordController.text = passwordController.text.trim();
        await loginCubit.loginUser(context: context);
      }
      isLoading = false;
      emit(RegisterSuccess());
    } catch (e) {
      isLoading = false;
      print("Error: $e");
      emit(RegisterError(error: e.toString()));
    }
  }

  void registervalid(
      {required int selectedImage,
      required LogInCubit loginCubit,
      required BuildContext context}) {
    if (regKey.currentState!.validate()) {
      registerUser(
          selectedImage: selectedImage,
          loginCubit: loginCubit,
          context: context);
    }
  }
}

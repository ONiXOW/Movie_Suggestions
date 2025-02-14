import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_suggestions/ui/screens/register_screen/auth/register_state.dart';
import 'package:movie_suggestions/ui/screens/register_screen/auth/register_use_case.dart';
import 'package:movie_suggestions/utils/assets_manager.dart';
@injectable
class RegisterViewModel extends Cubit<RegisterState> {
  RegisterUseCase registerUseCase;
  RegisterViewModel({required this.registerUseCase}) : super(AuthInitial());

  bool isLoading = false;

  var isObscured = false;
  int selectedIndex = 0;
  bool status = false;
  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController(text: 'mazen22@gmail.com');
  var passwordController = TextEditingController(text: "Mazen1967@");
  var nameController = TextEditingController(text: 'mazens222');
  var confirmPasswordController = TextEditingController(text: 'Mazen1967@');
  var phoneController = TextEditingController(text: '+201141446568');
  var avaterIdController = TextEditingController();
  List<String> avatarList = [
    AssetsManager.avatar1,
    AssetsManager.avatar2,
    AssetsManager.avatar3,
    AssetsManager.avatar4,
    AssetsManager.avatar5,
    AssetsManager.avatar6,
    AssetsManager.avatar7,
    AssetsManager.avatar8,
    AssetsManager.avatar9,
  ];
  void register()async {
    if (formKey.currentState?.validate() == true) {
      emit(RegisterLoadingState());
      var either = await registerUseCase.invoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        confirmPasswordController.text,
        phoneController.text,
        selectedIndex,
      );
      either.fold((error) {
        emit(RegisterFailedState(message: error.errorMessage));
      }, (response) {
        emit(RegisterSuccessState(registerResponseEntity: response));
      });
    }
  }
}

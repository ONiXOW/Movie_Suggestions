
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_suggestions/ui/screens/register_screen/cubit/register_states.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../../domain/use_cases/register_use_case.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;

  RegisterViewModel({required this.registerUseCase})
      : super(RegisterInitialState());

  //todo: hold data - handle logic
  bool isLoading = false;

  var isObscured = false;
  int selectedIndex = 0;
  bool status = false;
  final formKey = GlobalKey<FormState>();
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
  TextEditingController fullNameController =
      TextEditingController(text: 'Amira');
  TextEditingController phoneController =
      TextEditingController(text: '01234567896');
  TextEditingController mailController =
      TextEditingController(text: 'amira66@route.com');
  TextEditingController passwordController =
      TextEditingController(text: 'Amira123456');
  TextEditingController rePasswordController =
      TextEditingController(text: 'Amira123456');
  TextEditingController avaterController =
      TextEditingController(text: "1"  );


  void register() async {
    if (formKey.currentState?.validate() == true) {
      emit(RegisterLoadingState());
      var either = await registerUseCase.invoke(
          fullNameController.text,
          mailController.text,
          passwordController.text,
          rePasswordController.text,
          phoneController.text,
    int.parse( avaterController.text )
      );
      either.fold((error) {
        emit(RegisterErrorState(failures: error));
      }, (response) {
        emit(RegisterSuccessState(responseEntity: response));
      });
    }
  }
}

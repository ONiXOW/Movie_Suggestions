import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

import 'package:flutter_switch/flutter_switch.dart';
import 'package:movie_suggestions/ui/screens/auth_cubit/auth_cubit.dart';
import 'package:movie_suggestions/ui/screens/auth_cubit/auth_state.dart';
import 'package:movie_suggestions/ui/screens/home_screen/home_screen.dart';
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

static const String routeName="Login_Screen";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {

  bool status = false;
  String language='ar';
  var  isObscured=false;
  var emailController=TextEditingController(text: 'mazen22@gmail.com');
  var passwordController=TextEditingController(text: 'Mazen1967@');
  final formKey=GlobalKey<FormState>();

  bool isLoading = false;

  void _login() async {
    if (!formKey.currentState!.validate()) return;
    setState(() => isLoading = true);

    final response = await ApiService.login(
      emailController.text,
      passwordController.text,
    );

    setState(() => isLoading = false);

    if (response != null && response['error'] == null) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response?['error'] ?? 'Login failed')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {

    final _controller = ValueNotifier<bool>(false);
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;

    return Scaffold(
backgroundColor:AppColors.blackColor,
body: SingleChildScrollView(
  child: Form(
    key: formKey,
    child: BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state) {
    // TODO: implement listener
    if(state is LoginSuccessState){
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }
    if(state is LoginFailedState){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Container(
        child: Text(state.message),
      )));
    }
  },

  builder: (context, state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(top: height*0.08),
          alignment: Alignment.center,
            child: Image.asset(AssetsManager.logoIcon,)
        ),
        SizedBox(height: height*0.04,),
        TextFieldWidget(
          controller: emailController,
            hintText: 'Email',

          validator: (text){
    if(text==null||text.trim().isEmpty){
    return 'Please Enter Email';
    }

    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text);
    if (!emailValid){
      return 'Please Enter Email Valid';
    }
          },
          color: AppColors.greyColor,
          prefixIcon: Image.asset(AssetsManager.emailIcon),


        ),
        SizedBox(height: height*0.03,),
        TextFieldWidget(
            hintText: 'Password',
          obscureText: true,
          color: AppColors.greyColor,
          validator: (text){
              if(text==null||text.trim().isEmpty){
                return "Please Enter Password";
              }
              if (text.length<6){
                return "Password Should be at Least 6 chars";
              }
          },
          controller: passwordController,
          prefixIcon: Image.asset(AssetsManager.passwordIcon),
          sufixIcon: IconButton(
            color: AppColors.whiteColor,
            iconSize: 24,
            onPressed: (){
              isObscured=!isObscured;
              setState(() {
              });
            },
            icon:Icon(isObscured?Icons.visibility:Icons.visibility_off),
          ),
        ),
        SizedBox(height: height*0.02,),
        ElevatedButton(

            onPressed: (){
              // todo: Navigation to Forget Password Screen
            },
          style: ElevatedButton.styleFrom(
            iconColor: AppColors.blackColor,
            foregroundColor: AppColors.transparentColor,
            shadowColor: AppColors.transparentColor,
            elevation: 0.0,
            backgroundColor: AppColors.transparentColor

          ),

            child: Text('Forget Password?',style: AppStyles.regular14Yellow,),



        ),
        SizedBox(height: height*0.02,),
        CustomeElevatedButton(
            text: state is LoginLoadingState?'Loading...':'Login',
            onButton: (){
            //todo////////////////////////////////////
              if(formKey.currentState!.validate()){

              }

            }
        ),
        SizedBox(height: height*0.02,),
       Center(
         child: Text.rich(TextSpan(
           children:[
             TextSpan(
               text: 'Don’t Have Account ?',style: AppStyles.regular14White
             ),
             TextSpan(
               text: 'Create One',style: AppStyles.bold14Primary,
               recognizer:TapGestureRecognizer()..onTap=(){
                 Navigator.of(context).pushNamed(RegisterScreen.routeName);
               }
             )
           ]
         )),
       ),
        SizedBox(height: height*0.02,),
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
           Text('Or',style: AppStyles.regular14Yellow,),
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
        SizedBox(height: height*0.02,),
        CustomeElevatedButton(text: 'Login With Google', onButton: (){},
          logoButton:Image.asset(AssetsManager.googleIcon) ,
        ),
        SizedBox(height: height*0.02,),
        AnimatedToggle()
      ],
    );
  },
),
  ),
),
    );

  }
}

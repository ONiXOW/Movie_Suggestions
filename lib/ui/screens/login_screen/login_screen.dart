import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:icons_plus/icons_plus.dart';

import 'package:flutter_switch/flutter_switch.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../../../../utils/assets_manager.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

import '../../../../widgets/animated_toggle.dart';
import '../../../../widgets/custome_elevated_button.dart';
import '../../../../widgets/text_field_widget.dart';
import '../register_screen/register_screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
static const String routeName="Login_Screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {

  bool status = false;
  String language='ar';
  var  isObscured=false;
  @override
  Widget build(BuildContext context) {

    final _controller = ValueNotifier<bool>(false);
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return
      Scaffold(
backgroundColor:AppColors.blackColor,
body: SingleChildScrollView(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Container(
        margin: EdgeInsets.only(top: height*0.08),
        alignment: Alignment.center,
          child: Image.asset(AssetsManager.logoIcon,)
      ),
      SizedBox(height: height*0.04,),
      TextFieldWidget(
          hintText: 'Email',
        color: AppColors.greyColor,
        prefixIcon: Image.asset(AssetsManager.emailIcon),


      ),
      SizedBox(height: height*0.03,),
      TextFieldWidget(
          hintText: 'Password',
        obscureText: true,
        color: AppColors.greyColor,
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
          text: 'Login',
          onButton: (){}
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
  ),
),
    );

  }
}

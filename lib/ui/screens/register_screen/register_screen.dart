import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../../../../utils/assets_manager.dart';
import '../../../../widgets/animated_toggle.dart';
import '../../../../widgets/custome_elevated_button.dart';
import '../../../../widgets/text_field_widget.dart';
import '../login_screen/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'Register_Screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
  var isObscured=false;
  int selectedIndex = 0;
bool status=false;
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
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
        child: Column(
          children: [
            SizedBox(height: height*0.02),
        
            // **عرض قائمة الآفاتارات باستخدام `Row` و `SingleChildScrollView`**
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(avatarList.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: width*0.02),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: selectedIndex == index ? Colors.yellow : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: selectedIndex == index ? width*0.1:height*0.06,
                        backgroundImage: AssetImage(avatarList[index]),
                      ),
                    ),
                  );
                }
                ),
              ),
        
            ),
        SizedBox(height: height*0.06,),
        TextFieldWidget(
          hintText: 'Name',
          prefixIcon:Icon(Icons.contact_mail_outlined,color: AppColors.whiteColor,),
        
        ),
            SizedBox(height: height*0.03,),
            TextFieldWidget(
              hintText: 'Email',
              prefixIcon:Image.asset(AssetsManager.emailIcon),
        
            ),
            SizedBox(height: height*0.03,),
            TextFieldWidget(
              hintText: 'Password',
              obscureText: true,
              sufixIcon:   IconButton(
                  color: AppColors.whiteColor,
                  iconSize: 24,
                  onPressed: (){
                    isObscured=!isObscured;
                    setState(() {
                    });
                  },
                  icon:Icon(isObscured?Icons.visibility:Icons.visibility_off),
                ),
              prefixIcon:Image.asset(AssetsManager.passwordIcon),
        
            ),
            SizedBox(height: height*0.03,),
            TextFieldWidget(
              hintText: 'Confirm Password',
              obscureText: false,
              prefixIcon:Image.asset(AssetsManager.passwordIcon),
              sufixIcon: IconButton(
                color: AppColors.whiteColor,
                iconSize: 24,
                onPressed: (){
                isObscured=!isObscured;
                setState(() {
                });
              },
               icon:Icon(isObscured?Icons.visibility:Icons.visibility_off),
              )
            ),
            SizedBox(height: height*0.03,),
            TextFieldWidget(
              hintText: 'Phone Number',
            keyBoardType: TextInputType.number,
            prefixIcon: Image.asset(AssetsManager.phoneIcon),
        
            ),
            SizedBox(height: height*0.03,),
            CustomeElevatedButton(text: 'Create Account',
                onButton: (){
              //todo: Navigation to Login Screen //
                  Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            }),
            Center(
              child: Text.rich(TextSpan(
                  children:[
                    TextSpan(
                        text: 'Already Have Account ?',style: AppStyles.regular14White
                    ),
                    TextSpan(
                        text: ' Login',style: AppStyles.bold14Primary,
                        recognizer:TapGestureRecognizer()..onTap=(){
                          Navigator.of(context).pushNamed(LoginScreen.routeName);
                        }
                    )
                  ]
              )
              ),
            ),
            SizedBox(height: height*0.03,),
            AnimatedToggle()
          ],
        ),
      ),
    );
  }
}

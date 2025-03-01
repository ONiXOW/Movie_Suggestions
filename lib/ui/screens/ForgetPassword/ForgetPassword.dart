import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../CustemWidget/CustemTextField.dart';
import '../../../CustemWidget/CustomButtom.dart';



class ForgetPassword extends StatelessWidget {
  static const  String routename="register";
  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Forgot password",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Color(0xffF6BD00),
          )),),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal:0.04*width,vertical: 0.02*height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset(
                  height: 0.500*height,
                  width: 1*width,
                  "assets/images/Forgot password-bro 1.svg"),
              SizedBox(height: 0.01*height,),

              SizedBox(height: 0.01*height,),
              CustomTextfield(//email
                  backgroundColor: Color(0xff282A28),
                  texthintStyle: TextStyle(color: Colors.white),
                  preficon: Icon(Icons.email,color: Colors.white,),
                  bordercolor: Colors.transparent,
                  hinttext: "Email"),
              SizedBox(height: 0.03*height),
              CustomButton(text: 'Verify Email', onButtonClicked: (){},
              buttonColor: Color(0xffF6BD00),
              )



                      ]
                  ),
                ),
              ),
          );

  }
}

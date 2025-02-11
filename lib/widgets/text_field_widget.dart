
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

typedef myValidator= String? Function(String?);

class TextFieldWidget extends StatelessWidget {

  Color? color;
  String hintText;
  Key ?key;
  String ?label;
  TextStyle? hintStyle;
  TextStyle? labelStyle;
  Widget?prefixIcon;
  Widget?sufixIcon;
  bool obscureText;
  int?maxLines;
  myValidator?validator;
  TextEditingController?controller;
  TextInputType?keyBoardType;
  TextFieldWidget({this.controller,this.validator,this.color,required this.hintText,this.label,this.hintStyle,this.labelStyle,this.obscureText=false,
    this.prefixIcon,this.sufixIcon,this.maxLines,this.key,this.keyBoardType=TextInputType.text});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width*0.02,

      ),
      padding: EdgeInsets.symmetric(
          horizontal: width*0.01,

      ),
      child: TextFormField(
        keyboardType:keyBoardType ,
        controller: controller,
        validator: validator,
        obscureText: obscureText,

key: key,
        maxLines: maxLines??1,
        cursorColor: AppColors.yellowColor,
        style: AppStyles.medium16White,

        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle??AppStyles.medium16White,
          labelStyle: hintStyle??AppStyles.medium16White,
          labelText: label,
          prefixIcon: prefixIcon,
         focusColor: AppColors.greenColor,
          filled: true,
          fillColor: AppColors.greyColor,
          suffixIcon: sufixIcon,
          enabledBorder: OutlineInputBorder(

            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: color??AppColors.greyColor,
                width: 2
            ),

          ),
          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: color??AppColors.greyColor,
                width: 2
            ),

          ),
          errorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.red,
                width: 2
            ),

          ),

          focusedErrorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.red,
                width: 2
            ),

          ),
        ),

      ),
    );
  }
}

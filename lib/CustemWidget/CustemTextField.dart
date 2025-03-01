import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef validation = String? Function(String?)?;

class CustomTextfield extends StatelessWidget {
  String hinttext;
  Widget? preficon;
  Widget? suficon;
  TextStyle? texthintStyle;
  Color? bordercolor; // لون الحدود
  Color? indicatorcolor; // لون المؤشر
  Color? iconColor; // لون الأيقونات
  Color? textColor; // لون النص داخل الحقل
  Color? focusedBorderColor; // لون الحدود عند التركيز
  Color? errorBorderColor; // لون الحدود عند حدوث خطأ
  Color? backgroundColor; // لون خلفية الزرار
  int? linesnumber;
  validation? validator;
  TextEditingController? controller;

  // Constructor مع إضافة الخصائص
  CustomTextfield({
    required this.hinttext,
    // this.backgroundColor,
    this.preficon,
    this.suficon,
    this.texthintStyle,
    this.bordercolor,
    this.controller,
    this.linesnumber,
    this.validator,
    this.indicatorcolor,
    this.iconColor,
    this.textColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.backgroundColor, // إضافة الخاصية الجديدة
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(

        controller: controller,
        style: TextStyle(color: textColor ?? Colors.black), // تخصيص لون النص داخل الحقل
        showCursor: true,
        validator: validator,
        decoration: InputDecoration(
          filled: true, // إضافة هذه الخاصية لضمان أن اللون يظهر

          prefixIcon: preficon,
          suffixIcon: suficon,
          fillColor: backgroundColor ?? Colors.white, // تخصيص لون الخلفية
          prefixIconColor: iconColor ?? Colors.grey, // لون الأيقونة
          suffixIconColor: iconColor ?? Colors.grey, // لون الأيقونة
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: bordercolor ?? Colors.grey, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: focusedBorderColor ?? Colors.blue, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: errorBorderColor ?? Colors.red, width: 2),
          ),
          hintText: hinttext,
          hintStyle: texthintStyle ?? TextStyle(color: Colors.grey), // تخصيص لون النص التلميحي
        ),
        cursorColor: indicatorcolor ?? Colors.blue, // لون المؤشر
        maxLines: linesnumber ?? 1,
      ),
    );
  }
}

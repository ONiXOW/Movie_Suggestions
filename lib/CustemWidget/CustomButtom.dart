import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final Color? buttonColor;
  final Widget? prefixButtonIcon;
  final String text;
  final TextStyle? textStyle;
  final Function onButtonClicked;

  CustomButton({
    required this.text,
    this.buttonColor,
    this.prefixButtonIcon,
    this.textStyle,
    required this.onButtonClicked,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        backgroundColor: buttonColor ?? Colors.white, // لون الخلفية
        side: BorderSide(
          color: Colors.transparent, // لون الحدود
        ),
      ),
      onPressed: () {
        onButtonClicked(); // عند الضغط على الزر
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixButtonIcon != null) ...[
            prefixButtonIcon!, // الأيقونة إذا كانت موجودة
            SizedBox(width: 10), // مسافة بين الأيقونة والنص
          ],
          Text(
            text,
            style: textStyle ??
                TextStyle(
                  color: Colors.black, // لون النص
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                ),
          ),
        ],
      ),
    );
  }
}

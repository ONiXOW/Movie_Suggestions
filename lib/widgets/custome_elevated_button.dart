import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';


class CustomeElevatedButton extends StatelessWidget {
String ?text;
Widget?logoButton;
Function?onButton;
CustomeElevatedButton({required this.text,this.logoButton,required this.onButton});


  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
   return Container(
     margin: EdgeInsets.symmetric(
       horizontal: width*0.04,
           vertical: height*0.02
     ),
     child: ElevatedButton(

       style: ElevatedButton.styleFrom(
         backgroundColor:AppColors.primaryColor,
         shape:RoundedRectangleBorder(

           borderRadius: BorderRadius.circular(10),
           side: BorderSide(
             color: AppColors.primaryColor,
             width: 1
           ),
         ),

         padding: EdgeInsets.symmetric(
           vertical: height * 0.03,
           horizontal: width * 0.04,
         ),


       ),
          onPressed: (){
         if (onButton!=null){
           onButton!();
         }
          },
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             logoButton??SizedBox(),
              SizedBox(width: width*0.02,),
              Text('$text',style: AppStyles.regular20Grey,),


            ],
          )
      ),
   );
  }
}

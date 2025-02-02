import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/assets_manager.dart';

class AnimatedToggle extends StatefulWidget {

  @override
  State<AnimatedToggle> createState() => _AnimatedToggleState();
}

class _AnimatedToggleState extends State<AnimatedToggle> {
String language='ar';

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return     Center(
      child: AnimatedToggleSwitch<String>.rolling(
        current: language,
        values: ['ar', 'en'],

        onChanged: (newLanguage){
          language=newLanguage;
          setState(() {

          });
        },

        iconBuilder:(value,foreground){
          if(value=='en'){
            return Image.asset(AssetsManager.egyptIcon);
          }else{
            return Image.asset(AssetsManager.americanIcon);

          }
        },
        style: ToggleStyle(
          borderColor: AppColors.primaryColor,
          indicatorColor: AppColors.primaryColor,
          backgroundColor: AppColors.transparentColor,
        ),
        height: height*0.05,
      ),
    );
  }
}

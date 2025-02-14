import 'package:flutter/material.dart';
import 'package:movie_suggestions/ui/tabs/category_tab/category_tab.dart';
import 'package:movie_suggestions/ui/tabs/home_tab/home_tab.dart';
import 'package:movie_suggestions/ui/tabs/profile_tab/profile_tab.dart';
import 'package:movie_suggestions/ui/tabs/seearch_tab/search_tab.dart';
import 'package:movie_suggestions/utils/app_colors.dart';
import 'package:movie_suggestions/utils/assets_manager.dart';

class HomeScreen extends StatefulWidget {
static const String routeName='Home_Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex=0;
List<Widget>tabs=[
  HomeTab(),
  SearchTab(),
  CategoryTab(),
  ProfileTab(),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:Theme(data:Theme.of(context).copyWith(canvasColor: AppColors.greyColor) ,
          child: BottomAppBar(
elevation: 0,
        padding: EdgeInsets.zero,
        notchMargin: 2,

        shape: CircularNotchedRectangle() ,
      child: BottomNavigationBar(

         currentIndex: selectedIndex,
        onTap: (index){
           selectedIndex=index;
           setState(() {});
        },
        selectedItemColor: AppColors.primaryColor,
     enableFeedback: true,
        backgroundColor: AppColors.blackColor,
        items: [
      buildBottomNavigationBarItem(
      icon: AssetsManager.iconHome,
      iconSelected: AssetsManager.iconHomeSelected,
      index: 0,

      ),
      buildBottomNavigationBarItem(
      icon: AssetsManager.iconSearch,
      iconSelected: AssetsManager.iconSearchSelected,
      index: 1,
      ),
      buildBottomNavigationBarItem(
      icon: AssetsManager.iconCategory,
      iconSelected: AssetsManager.iconCategorySelected,
      index: 2,
      ),
      buildBottomNavigationBarItem(
      icon: AssetsManager.iconProfile,
      iconSelected: AssetsManager.iconProfileSelected,
      index: 3,
      )
        ],

      ),

      ),
      ),
      body: tabs[selectedIndex],
    );
  }
BottomNavigationBarItem buildBottomNavigationBarItem({
  required String icon, required iconSelected, required index, label})

{
  return BottomNavigationBarItem(
      icon:ImageIcon(AssetImage(icon)),
    label: label??"");
}
}


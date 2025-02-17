import 'package:flutter/material.dart';
import 'package:movie_suggestions/ui/tabs/category_tab/category_tab.dart';
import 'package:movie_suggestions/ui/tabs/home_tab/home_tab.dart';
import 'package:movie_suggestions/ui/tabs/profile_tab/profile_tab.dart';
import 'package:movie_suggestions/ui/tabs/seearch_tab/search_tab.dart';
import 'package:movie_suggestions/utils/app_colors.dart';
import 'package:movie_suggestions/utils/assets_manager.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home_Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    CategoryTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Theme(
          data: Theme.of(context).copyWith(canvasColor: AppColors.greyColor),

          child: BottomAppBar(
            height: height*0.06,
            shadowColor: AppColors.transparentColor,
            color: AppColors.transparentColor,

            padding: EdgeInsets.symmetric(
              horizontal: width*0.0009,
              vertical: height*0.0004
            ),

            shape: CircularNotchedRectangle(),
            notchMargin: 6,
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                setState(() {selectedIndex = index;});
              },
              selectedItemColor: AppColors.primaryColor,
              enableFeedback: true,

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
                ),

              ],

            ),
          ),
        ),
      ),

      body: tabs[selectedIndex],
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    required String icon,
    required String iconSelected,
    required int index,
    String? label,
  }) {
    return BottomNavigationBarItem(
      icon: ImageIcon(AssetImage(icon)),
      label: label ?? "",
    );
  }
}

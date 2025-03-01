import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_suggestions/core/utils/assets_manager.dart';

import '../../../core/utils/app_colors.dart';
import 'cubit/home_states.dart';
import 'cubit/home_view_model.dart';

class HomeScreen extends StatefulWidget {

  static const String routeName="HomeScreen";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return BlocBuilder<HomeViewModel, HomeStates>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          backgroundColor:AppColors.backgroundColor,

          body: viewModel.bodyList[viewModel.selectedIndex],

          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Theme(
              data: Theme.of(context)
                  .copyWith(canvasColor: AppColors.greyColor),
              child: BottomNavigationBar(

                type: BottomNavigationBarType.fixed,
                elevation: 0,
                currentIndex: viewModel.selectedIndex,
                onTap: viewModel.bottomNavOnTap,
                iconSize: 24,


                // Adjust the icon size
                items: [
                  _bottomNavBarItemBuilder(
                    isSelected: viewModel.selectedIndex == 0,
                      selectedIcon: AssetsManager.iconHomeSelected,
                    unSelectedIcon: AssetsManager.iconHome

                  ),
                  _bottomNavBarItemBuilder(
                    isSelected: viewModel.selectedIndex == 1,
               selectedIcon:AssetsManager.iconSearchSelected,
                unSelectedIcon:AssetsManager.iconSearch,
                  ),
                  _bottomNavBarItemBuilder(
                    isSelected: viewModel.selectedIndex == 2,
                selectedIcon: AssetsManager.iconCategorySelected,
                unSelectedIcon: AssetsManager.iconCategory,
                  ),
                  _bottomNavBarItemBuilder(
                    isSelected: viewModel.selectedIndex == 3,
                  selectedIcon: AssetsManager.iconProfileSelected,
                    unSelectedIcon: AssetsManager.iconProfile,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _bottomNavBarItemBuilder({required bool isSelected,
    required String selectedIcon,
    required String unSelectedIcon
  }) {
    return BottomNavigationBarItem(
      icon: CircleAvatar(
        backgroundColor: AppColors.transparentColor,
        radius: 25,
        child: Image.asset(
          isSelected?selectedIcon:unSelectedIcon,
        ),
      ),
      label: "",
    );
  }
}
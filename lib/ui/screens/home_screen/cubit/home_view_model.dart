
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_suggestions/ui/tabs/profile_tab/profile_tab.dart';

import '../../../tabs/category_tab/category_tab.dart';
import '../../../tabs/home_tab/home_tab.dart';
import '../../../tabs/seearch_tab/search_tab.dart';
import 'home_states.dart';



class HomeViewModel extends Cubit<HomeStates> {
  HomeViewModel() : super(HomeInitialState());

  //todo: hold data - handle logic
  int selectedIndex = 0;
  List<Widget> bodyList = [
    HomeTab(),
   CategoryTab(),
   ProfileTab(),
    SearchTab()
  ];

  void bottomNavOnTap(int index) {
    selectedIndex = index;
    emit(ChangeSelectedIndexState());
  }
}

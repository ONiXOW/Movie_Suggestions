import 'package:flutter/material.dart';
import 'package:movie_suggestions/onboard%20screen/fifth-screen.dart';
import 'package:movie_suggestions/onboard%20screen/fourth-screen.dart';
import 'package:movie_suggestions/onboard%20screen/intro_screen.dart';
import 'package:movie_suggestions/onboard%20screen/second-screen.dart';
import 'package:movie_suggestions/onboard%20screen/third-screen.dart';
import 'package:movie_suggestions/onboard%20screen/last-screen.dart';

class OnboardingScreens extends StatefulWidget {
  @override
  _OnboardingScreensState createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  final List<Widget> _pages = [
    FirstScreen(),
    SecondScreen(),
    ThirdScreen(),
    FourthScreen(),
    FifthScreen(),
    LastScreen(),
  ];

  void navigateToNextPage() {
    if (_currentIndex < _pages.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void navigateToPreviousPage() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemCount: _pages.length,
        itemBuilder: (context, index) {
          return _pages[index];
        },
      ),
    );
  }
}

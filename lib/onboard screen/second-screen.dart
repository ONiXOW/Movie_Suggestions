import 'package:flutter/material.dart';
import 'package:movie_suggestions/onboard%20screen/third-screen.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            bottom: 150,
            child: Image.asset(
              'assets/second-screen-bg.png',
                width: double.infinity,
                //height: double.infinity,
                fit: BoxFit.fill
            ),
          ),

          Positioned.fill(
            child: Image.asset(
                'assets/filter.png',
                width: double.infinity,
                //height: double.infinity,
                fit: BoxFit.fill
            ),
          ),

          // Curved Bottom Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)), // Curved effect
              child: Container(
                padding: EdgeInsets.all(27),
                decoration: BoxDecoration(
                  color: Color(0xFF121312),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Discover Movies',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Explore a vast collection of movies in all qualities and genres. '
                          'Find your next favorite film with ease.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFF6BD00),
                          padding: EdgeInsets.symmetric(horizontal: 130, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ThirdScreen()),
                          );
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

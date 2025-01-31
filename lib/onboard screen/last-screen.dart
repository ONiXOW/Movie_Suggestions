import 'package:flutter/material.dart';

class LastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            bottom: 200,
            child: Image.asset(
                'assets/last-screen-bg.png',
                width: double.infinity,
                //height: double.infinity,
                fit: BoxFit.fill
            ),
          ),

          Positioned.fill(
            child: Image.asset(
                'assets/filter-5.png',
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
                      'Start Watching Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),

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


                        },
                        child: Text(
                          'Finish',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0x121312),
                          padding: EdgeInsets.symmetric(horizontal: 130, vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Color(0xFFF6BD00),
                                width: 2.0,
                              )
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 5),
                            Text(
                              'Back',
                              style: TextStyle(
                                color: Color(0xFFF6BD00),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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

import 'package:flutter/material.dart';

import 'second_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(_buildPageRouteBuilder(SecondScreen()));
          },
          child: Text('Go to Second Screen'),
        ),
      ),
    );
  }

  PageRouteBuilder _buildPageRouteBuilder(Widget page) {
    return PageRouteBuilder(
      transitionDuration: Duration(seconds: 2),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeInOut));

        var offsetAnimation = animation.drive(tween);

        return ScaleTransition(
          scale: offsetAnimation,
          child: child,
        );
      },
    );
  }
}


import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Replace the splash screen after 2 seconds
    Timer(const Duration(seconds: 5), () {
      // Use pushReplacement to replace the splash screen
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Empty space at the top
            Expanded(
              child: Center(
                child: Image(
                  image: NetworkImage(
                      "https://tse4.mm.bing.net/th?id=OIP.i3XeP5dz0izrOCNqj6IfnAHaEK&pid=Api&P=0&h=220"),
                  height: 400,
                  width: 400,
                ),
              ),
            ),
            // Text at the bottom
            Text(
              "Welcome",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
         child: Container(
           child: Text("Home"),
         ),
       ),
    );
  }
}

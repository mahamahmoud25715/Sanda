import 'dart:async';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:sanad1_app/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
=======

import 'package:sanad_app/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

>>>>>>> 2629d538c049cc46049e955c04477465729388a0
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;
<<<<<<< HEAD
  Timer? _timer;

  static const Color sanadDarkBlue = Color(0xFF102A43);
=======

>>>>>>> 2629d538c049cc46049e955c04477465729388a0
  static const Color sanadGreen = Color(0xFF179E79);

  @override
  void initState() {
    super.initState();
<<<<<<< HEAD
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
=======

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
>>>>>>> 2629d538c049cc46049e955c04477465729388a0
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
<<<<<<< HEAD
        curve: Interval(0.0, 0.5, curve: Curves.easeIn),
=======
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
>>>>>>> 2629d538c049cc46049e955c04477465729388a0
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.2,
          1.0,
          curve: Cubic(0.175, 0.885, 0.32, 1.275),
        ),
      ),
    );

    _controller.forward();

<<<<<<< HEAD
    _timer = Timer(Duration(milliseconds: 3500), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => LoginScreen()),
=======
    Timer(const Duration(milliseconds: 3500), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) =>  LoginScreen(),
          ),
>>>>>>> 2629d538c049cc46049e955c04477465729388a0
        );
      }
    });
  }

  @override
  void dispose() {
<<<<<<< HEAD
    _timer?.cancel();
=======
>>>>>>> 2629d538c049cc46049e955c04477465729388a0
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _scaleAnimation,
              child: FadeTransition(
                opacity: _opacityAnimation,
<<<<<<< HEAD
                child: Image.asset('assets/images/sanad_logo.jpeg', width: 180),
              ),
            ),
            SizedBox(height: 25),

            SizedBox(height: 50),
            CircularProgressIndicator(color: sanadGreen, strokeWidth: 2),
=======
                child: Image.asset(
                  'assets/images/sanad_logo.jpeg',
                  width: 180,
                ),
              ),
            ),
            const SizedBox(height: 50),
            const CircularProgressIndicator(
              color: sanadGreen,
              strokeWidth: 2,
            ),
>>>>>>> 2629d538c049cc46049e955c04477465729388a0
          ],
        ),
      ),
    );
  }
}
<<<<<<< HEAD
=======

>>>>>>> 2629d538c049cc46049e955c04477465729388a0

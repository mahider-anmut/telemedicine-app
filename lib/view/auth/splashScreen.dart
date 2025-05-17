import 'dart:async';
import 'package:flutter/material.dart';

import '../../constants/assets.dart';
import '../../constants/constants.dart';
import '../../service/shared_preference.dart';
import '../../utils/themes.dart';
import '../homePage.dart';
import 'introPage.dart';
import 'loginPage.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _imageAnimation;
  late Animation<Offset> _freshAnimation;
  late Animation<Offset> _martAnimation;
  late Animation<Offset> _groceryAppAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    // Define the slide animations
    _imageAnimation = Tween<Offset>(
      begin: const Offset(0, -10),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _freshAnimation = Tween<Offset>(
      begin: const Offset(-10, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _martAnimation = Tween<Offset>(
      begin: const Offset(10, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _groceryAppAnimation = Tween<Offset>(
      begin: const Offset(0, 20),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Define the opacity animation
    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Start the animation
    _controller.forward();

    // Set up a timer to navigate to the next screen after the animation completes
    Timer(const Duration(seconds: 7), () {
      checkFirstLaunch();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> checkFirstLaunch() async {
    bool didFirstLaunch = await SharedPreference.getBool(Constants.didFirstLaunch);
    bool isLoggedIn = await SharedPreference.getBool(Constants.isLoggedIn);

    if (!didFirstLaunch) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const IntroScreen()),
      );
    } else {
      if (isLoggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return FadeTransition(
                    opacity: _opacityAnimation,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SlideTransition(
                          position: _imageAnimation,
                          child: Image.asset(
                            LocalAssets.splashScreen,
                            width: 700,
                            height: 500,
                          ),
                        ),
                        const SizedBox(height: 20), // Space between image and text
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SlideTransition(
                              position: _freshAnimation,
                              child: Text(
                                'Tele',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.getThemeExtension(context).primaryLightColor!
                                ),
                              ),
                            ),
                            SlideTransition(
                              position: _martAnimation,
                              child: Text(
                                'medicine',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.getThemeExtension(context).primaryLightColor!
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20), // Space between text and Grocery App
                        SlideTransition(
                          position: _groceryAppAnimation,
                          child: Text(
                            '"Bringing Doctors Closer to You."',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppTheme.getThemeExtension(context).primaryLightColor!,
                              // fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}

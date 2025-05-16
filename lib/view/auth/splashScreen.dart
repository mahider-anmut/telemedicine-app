import 'package:flutter/material.dart';
import 'package:telemedicine/constants/textStyles.dart';

import '../../constants/assets.dart';
import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../service/shared_preference.dart';
import '../homePage.dart';
import 'introPage.dart';
import 'loginPage.dart';
import 'pending.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          // Background image
          Image.asset(
            LocalAssets.splashScreen, // Make sure to define this in your assets
            fit: BoxFit.cover,
          ),

          // Foreground content
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DisappearingWidget(
                    duration: const Duration(milliseconds: 5000),
                    child: Image.asset(
                      LocalAssets.appLogo,
                      height: 200,
                    ),
                  ),
                ],
              ),
              Text("TeleMedicine",style: AppTextStyles.bigTitleStyle(context)),
              SizedBox(height: 30,)
            ],
          ),
        ],
      ),
    );
  }
}


class DisappearingWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const DisappearingWidget({
    required this.child,
    required this.duration,
    super.key,
  });

  @override
  _DisappearingWidgetState createState() => _DisappearingWidgetState();
}

class _DisappearingWidgetState extends State<DisappearingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    // Slide animation: start from left (-1) and end at the center (0)
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0), // Start off-screen to the left
      end: const Offset(0.0, 0.0),    // End at the center
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _slideAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkFirstLaunch();
      }
    });

    // Start the animation after a short delay
    Future.delayed(const Duration(milliseconds: 500))
        .then((value) => _controller.forward());
  }

  Future<void> checkFirstLaunch() async {
    bool didFirstLaunch = await SharedPreference.getBool(Constants.didFirstLaunch);
    bool isLoggedIn = await SharedPreference.getBool(Constants.isLoggedIn);
    bool requestingApproval = await SharedPreference.getBool(Constants.requestingApproval);
    bool approved = await SharedPreference.getBool(Constants.approved);

    if (!didFirstLaunch) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const IntroScreen()),
      );
    } else {
      if (isLoggedIn && !requestingApproval && approved) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else if (isLoggedIn && requestingApproval) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AccountApprovalPendingPage()),
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: widget.child,
    );
  }
}
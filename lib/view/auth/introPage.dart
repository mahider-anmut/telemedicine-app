import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../utils/themes.dart';
import '../../widgets/introWidget.dart';


class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {


  final PageController  _pageController = PageController();

  int _activePage = 0;

  void onNextPage(){
    if(_activePage  < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastEaseInToSlowEaseOut,);
    }
  }

  final List<Map<String, dynamic>> _pages = [
    {
      'color': "primary",
      'title': 'Remote Consultations',
      'image': 'assets/images/intro/image1.png',
      'description': "Connect with healthcare professionals from anywhere using your smartphone, tablet, or computer—no travel or waiting rooms needed.",
      'skip': true
    },
    {
      'color': "secondary",
      'title': '24/7 Accessibility',
      'image': 'assets/images/intro/image2.png',
      'description': 'Access healthcare services anytime, day or night. Ideal for emergencies, remote areas, or when traditional clinics are closed',
      'skip': true
    },
    {
      'color': "primary",
      'title': 'Secure & Confidential',
      'image': 'assets/images/intro/image3.png',
      'description': 'All consultations are encrypted and compliant with healthcare regulations',
      'skip': false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              scrollBehavior: AppScrollBehavior(),
              onPageChanged: (int page) {
                setState(() {
                  _activePage = page;
                });
              },
              itemBuilder: (BuildContext context, int index){
                return IntroWidget(
                  index: index,
                  color: _pages[index]['color']=="primary"?AppTheme.getThemeExtension(context).primaryColor!:AppTheme.getThemeExtension(context).secondaryColor!,
                  title: _pages[index]['title'],
                  description: _pages[index]['description'],
                  image: _pages[index]['image'],
                  skip: _pages[index]['skip'],
                  onTab: onNextPage,
                );
              }
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 1.75,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildIndicator(context)
                )
              ],
            ),
          )

        ],
      ),
    );
  }

  List<Widget> _buildIndicator(BuildContext context) {
    final indicators =  <Widget>[];

    for(var i = 0; i < _pages.length; i++) {

      if(_activePage == i) {
        indicators.add(_indicatorsTrue(context));
      }else{
        indicators.add(_indicatorsFalse(context));
      }
    }
    return  indicators;
  }

  Widget _indicatorsTrue(BuildContext context) {
    final Color color;
    if(_activePage == 0){
      color = AppTheme.getThemeExtension(context).primaryColor!;
    } else  if(_activePage ==  1) {
      color = AppTheme.getThemeExtension(context).primaryLightColor!;
    } else {
      color = AppTheme.getThemeExtension(context).primaryColor!;
    }

    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: 6,
      width: 42,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: color,
      ),
    );
  }

  Widget _indicatorsFalse(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: 8,
      width: 8,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey.shade100,
      ),
    );
  }
}
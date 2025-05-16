import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../constants/textStyles.dart';
import '../service/localization.dart';
import '../service/shared_preference.dart';
import '../view/auth/loginPage.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({
    super.key,
    required this.color,
    required this.title,
    required this.description,
    required this.skip,
    required this.image,
    required this.onTab,
    required this.index,});

  final Color color;
  final String title;
  final String description;
  final bool skip;
  final String image;
  final VoidCallback onTab;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: color,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.86,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.contain
                )
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: MediaQuery.of(context).size.height / 2.16,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: index == 0 ? const Radius.circular(100) : const Radius.circular(0),
                    topRight: index == 2 ? const Radius.circular(100) : const Radius.circular(0),
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: Column(
                  children: [
                    const SizedBox(height: 62,),
                    Text(title, style: AppTextStyles.titleStyle),
                    const SizedBox(height: 16,),
                    Text(description, style: const TextStyle(fontSize: 18, height: 1.5, color: Colors.grey), textAlign: TextAlign.center,)
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 0,
            left: 0,
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: skip
                    ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () async {
                        await SharedPreference.setBool(Constants.didFirstLaunch,true);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      },
                      child: Text(AppLocalizations.of(context).translate('SkipNow'), style: TextStyle(color: Colors.black),),
                    ),
                    GestureDetector(
                      onTap: onTab,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: const Icon(Icons.arrow_circle_right, color: Colors.white, size: 42),
                      ),
                    )
                  ],
                )
                    :  SizedBox(
                  height: 46,
                  child: MaterialButton(
                    color: color,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    onPressed: () async {
                      await SharedPreference.setBool(Constants.didFirstLaunch,true);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                    child:  Text(AppLocalizations.of(context).translate('GetStarted'), style: TextStyle(color: Colors.white)),
                  ),
                )
            ),
          )
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:telemedicine/constants/assets.dart';

import '../constants/colors.dart';
import '../constants/textStyles.dart';
import '../view/notificationPage.dart';

class HeaderCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
        image: DecorationImage(
          image: AssetImage(LocalAssets.bgHeaderImage), // Change path to your image
          fit: BoxFit.cover,
          alignment: Alignment(0.6,-0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu,color: AppColors.mainIconColor,),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: const Text(
                        'Current Location',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.headerTextLabelStyle,
                      ),
                    ),
                    SizedBox(width: 40,)
                    // CircleAvatar(
                    //   radius: 20,
                    //   backgroundColor: AppColors.buttonColor,
                    //   child: IconButton(
                    //     icon: Icon(Icons.notifications,color: AppColors.mainIconColor!,),
                    //     onPressed: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(builder: (context) => NotificationPage()),
                    //       );
                    //     },
                    //   )
                    //
                    // ),
                  ],
                ),
              ),
              ]
          ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Text(
                  'Bahirdar, Ethiopia',
                  style: AppTextStyles.headerTextBodyStyle,
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 30),
              //   child: Text(
              //     'Tracking Your Package',
              //     style: AppTextStyles.headerTextTitleStyle,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Center(
                  child: Text(
                    'Bringing Doctors'.toUpperCase(),
                    style: AppTextStyles.headerTextTitleStyle,
                  ),
                ),
              ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Center(
              child: Text(
                'Closer to You'.toUpperCase(),
                style: AppTextStyles.headerTextTitleStyle,
              ),
            ),
          ),
              SizedBox(height: 20),

            ],
          ),


    );
  }
}

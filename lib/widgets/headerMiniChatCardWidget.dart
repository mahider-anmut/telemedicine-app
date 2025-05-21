import 'package:flutter/material.dart';
import 'package:telemedicine/constants/assets.dart';

import '../constants/colors.dart';
import '../constants/textStyles.dart';
import '../utils/themes.dart';
import '../view/notificationPage.dart';

class HeaderMiniChatCardWidget extends StatelessWidget {

  final String title;

  const HeaderMiniChatCardWidget({
    super.key,
    required this.title,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      decoration:  BoxDecoration(
        // borderRadius: BorderRadius.only(
        //   bottomLeft: Radius.circular(60),
        //   bottomRight: Radius.circular(60),
        // ),
        // image: DecorationImage(
        //   image: AssetImage(LocalAssets.bgHeaderImage), // Change path to your image
        //   fit: BoxFit.cover,
        //   alignment: Alignment(-0.2,-0.2),
        // ),
        color: AppTheme.getThemeExtension(context).primaryColor!
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_outlined,color: AppColors.mainIconColor,),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),

                    const SizedBox(width: 8,),
                    const Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/img/doctor01.jpeg'), // Replace with your image path
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Dr. Angie Brekke', style: TextStyle(color: AppColors.mainTextAltColor)),
                            Text('Online', style: TextStyle(color: AppColors.mainTextAltColor, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.more_vert, color: AppColors.mainIconColor),
                      onPressed: () {
                        // More actions
                      },
                    ),

                  ],
                ),
              ),
              ]
          ),


            ],
          ),


    );
  }
}

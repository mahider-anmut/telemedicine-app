import 'package:flutter/material.dart';
import 'package:telemedicine/constants/assets.dart';

import '../constants/colors.dart';
import '../constants/textStyles.dart';
import '../utils/themes.dart';
import '../view/notificationPage.dart';

class HeaderMiniCardWidget extends StatelessWidget {

  final String title;

  const HeaderMiniCardWidget({
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

                     Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.headerTextTitleStyle,
                      ),
                    ),
                    const Spacer(),

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

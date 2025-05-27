import 'package:flutter/material.dart';
import 'package:telemedicine/constants/assets.dart';

import '../constants/colors.dart';
import '../constants/textStyles.dart';
import '../utils/themes.dart';
import '../view/notificationPage.dart';

class HeaderMiniChatCardWidget extends StatefulWidget {

  final String title;
  final String? imgUrl;
  final Function? rightIconPress;

  const HeaderMiniChatCardWidget({
    super.key,
    required this.title,
    required this.imgUrl,
    required this.rightIconPress
  });

  @override
  State<HeaderMiniChatCardWidget> createState() => _HeaderMiniChatCardWidgetState();
}

class _HeaderMiniChatCardWidgetState extends State<HeaderMiniChatCardWidget> {
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
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: widget.imgUrl!=null ? NetworkImage(widget.imgUrl!): const AssetImage(LocalAssets.avatar) as ImageProvider
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.title, style: TextStyle(color: AppColors.mainTextAltColor)),
                            Text('Online', style: TextStyle(color: AppColors.mainTextAltColor, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.video_call_outlined, color: AppColors.mainIconColor),
                      onPressed: () {
                        if(widget.rightIconPress!=null){
                          widget.rightIconPress!(context);
                        }
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

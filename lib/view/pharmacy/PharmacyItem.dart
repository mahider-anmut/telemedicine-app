import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../widgets/custom/customapp_bar.dart';
import '../../widgets/custom/detailstext1.dart';
import '../../widgets/custom/detailstext2.dart';
import '../../widgets/custom/text11.dart';
import '../../widgets/headerCardWidget.dart';
import '../../widgets/headerMiniCardWidget.dart';
// import 'HospitalDetails/hospital_details.dart';


class PharmacyItem extends StatefulWidget {
  const PharmacyItem({super.key});

  @override
  State<PharmacyItem> createState() => _PharmacyItemState();
}

class _PharmacyItemState extends State<PharmacyItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
      height: 277,
      decoration: BoxDecoration(
          color: AppColors.tabColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/img/hospita1.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 130,
                  ),
                  const Positioned(
                    right: 10,top: 10,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: AppColors.buttonColor,
                      child: Icon(Icons.favorite_outline,size: 20,color: Colors.white,),


                    ),
                  ),
                  Positioned(
                      right: 10,bottom: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                        height: 30,
                        width: 160,
                        decoration: BoxDecoration(
                          color: AppColors.bgColor,
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.star,color: AppColors.buttonColor,size: 20,),
                            Text11(text2: '4.6'),
                            Text2(text2: '(1k + Reviews)')



                          ],

                        ),

                      )
                  )

                ],
              )),
          const Padding(
            padding:
            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text1(
                  text1: 'Pharmacy 1',
                  size: 16,
                ),
                SizedBox(height: 4,),
                Text2(text2: '24Hrs open'),
                SizedBox(height: 4,),

                Row(
                  children: [
                    Icon(Icons.pin_drop_outlined,color:AppColors.buttonColor,size: 20,),
                    SizedBox(
                      width: 5,
                    ),
                    Text2(text2: 'Near Main road bahirdar')
                  ],
                ),

                SizedBox(height: 7,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.directions_walk_outlined,color:AppColors.buttonColor,size: 20,),
                        Text2(text2: ' 3.5km/50mins')

                      ],
                    ),

                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

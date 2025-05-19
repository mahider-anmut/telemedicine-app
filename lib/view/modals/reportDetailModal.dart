import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../widgets/custom/detailstext1.dart';
import '../../widgets/custom/detailstext2.dart';

class ReportDetailModal extends StatelessWidget {
  const ReportDetailModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [

                    const Spacer(),
                    const Text1(text1: 'Report Details'),
                    const Spacer(),

                  ],
                ),
                const SizedBox(height: 20,),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.tabColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius:26,
                        backgroundImage: AssetImage('assets/images/img/m3.png'),

                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text1(text1: 'James'),
                            SizedBox(height: 8,),
                            Text2(text2: 'Surgeon Specialist')


                          ],

                        ),
                      )




                    ],


                  ),



                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.tabColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text1(text1: 'Patient Details',size: 20,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text2(text2: 'Patient Name:'),
                           Text1(text1: 'Binish Sharma')

                         ],
                       ),
                       SizedBox(height: 8,),

                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text2(text2: 'Date:'),
                           Text1(text1: '19 Sep,2024')

                         ],
                       ),
                       SizedBox(height: 8,),

                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text2(text2: 'Age:'),
                           Text1(text1: '45 Years')

                         ],
                       ),

                     ],


                  ),

                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.tabColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text1(text1: 'Overview',size: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text2(text2: 'Problem:'),
                          Text1(text1: 'Surgery')

                        ],
                      ),
                      SizedBox(height: 8,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text2(text2: 'Test:'),
                          Text1(text1: 'Blood Test')

                        ],
                      ),
                      SizedBox(height: 8,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text2(text2: 'Advice:'),
                          Text1(text1: 'Eat Plenty Of Nutrtions')

                        ],
                      ),
                      SizedBox(height: 8,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text2(text2: 'Dessprin:'),
                          Text1(text1: '7 Days')

                        ],
                      ),
                      SizedBox(height: 8,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text2(text2: 'Augmented:'),
                          Text1(text1: '4 Days')

                        ],
                      ),
                      SizedBox(height: 8,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text2(text2: 'Septran Ds:'),
                          Text1(text1: '2 Days')

                        ],
                      ),

                    ],


                  ),

                ),




              ],

            ),
          )),


    );
  }
}

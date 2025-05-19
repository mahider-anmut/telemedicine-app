import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../widgets/custom/detailstext1.dart';
import '../../widgets/custom/detailstext2.dart';
import '../modals/reportDetailModal.dart';

class ReportHomePage extends StatelessWidget {
  const ReportHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.text3Color)),
                        height: 30,
                        width: 30,
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 17,
                        ),
                      ),
                      const Spacer(),
                      const Text1(text1: 'Care Prescriptions'),
                      const Spacer(),

                    ],
                  ),
                  const SizedBox(height: 16),

                  const ReportItem(),
                  const ReportItem(),
                  const ReportItem(),
                  const ReportItem(),
                  const ReportItem(),
                  const ReportItem()











                ],

              ),
            ),
          )),


    );
  }
}

class ReportItem extends StatelessWidget {
  const ReportItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) =>
                    const ReportDetailModal()));
      },
      child: Container(
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
            Spacer(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text1(text1: 'jamshed urooj'),
                  SizedBox(height: 8,),
                  Text2(text2: '9th Sep,2024')


                ],

              ),
            )




          ],


        ),



      ),
    );
  }
}

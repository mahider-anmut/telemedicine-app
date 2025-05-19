import 'package:flutter/material.dart';
import 'package:telemedicine/view/hospitals/hospitalItem.dart';


import '../../constants/colors.dart';
import '../../widgets/custom/customtextfield.dart';
import '../../widgets/custom/detailstext1.dart';
import '../../widgets/custom/text11.dart';
import '../../widgets/headerMiniCardWidget.dart';


class Hospitals extends StatelessWidget {
  const Hospitals({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderMiniCardWidget(title: "Hospitals",),
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: const CustomTextField(
                label: 'Search hospitals',
                icon: Icons.search,
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text1(text1: 'Hospitals (1 record)'),
                  InkWell(

                    child: const Text11(
                      text2: 'Sort By: Distance',
                      color: AppColors.text3Color,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 8.0),
            HospitalItem(),
            HospitalItem(),
            HospitalItem()


          ],
        ),
      ),
    );
  }
}

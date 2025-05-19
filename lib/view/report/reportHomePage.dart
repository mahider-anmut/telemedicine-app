import 'package:flutter/material.dart';

import '../../constants/assets.dart';
import '../../constants/colors.dart';
import '../../widgets/custom/customtextfield.dart';
import '../../widgets/custom/detailstext1.dart';
import '../../widgets/custom/detailstext2.dart';
import '../../widgets/headerMiniCardWidget.dart';
import '../modals/reportDetailModal.dart';

class ReportHomePage extends StatelessWidget {
  const ReportHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderMiniCardWidget(title: "Reports",),
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: const CustomTextField(
                label: 'Search Reports',
                icon: Icons.search,
              ),
            ),
            SizedBox(height: 16.0),

            const ReportItem(),
            const ReportItem(),
            const ReportItem(),
            const ReportItem(),
            const ReportItem(),
            const ReportItem()











          ],

        ),
      ),


    );
  }
}

class ReportItem extends StatelessWidget {
  const ReportItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
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
          child:  Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.buttonColor,
                  child: Icon(Icons.list_alt_outlined,color: AppColors.mainIconColor!,),

              ),
              // Spacer(),
              SizedBox(width: 30,),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text1(text1: 'Report Title'),

                    SizedBox(height: 8,),
                    Row(
                      children: [
                        Text2(text2: 'Doctor 1'),
                        Spacer(),
                        Text2(text2: '9th Sep,2024'),
                      ],
                    )
                  ],
                ),
              ),





            ],


          ),



        ),
      ),
    );
  }
}

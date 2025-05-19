import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../utils/themes.dart';
import '../../widgets/custom/customtextfield.dart';
import '../../widgets/custom/detailstext1.dart';
import '../../widgets/custom/detailstext2.dart';
import '../../widgets/custom/text11.dart';
import '../../widgets/headerMiniCardWidget.dart';

class CheckupHomePage extends StatefulWidget {
  const CheckupHomePage({super.key});

  @override
  State<CheckupHomePage> createState() => _CheckupHomePageState();
}

class _CheckupHomePageState extends State<CheckupHomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderMiniCardWidget(title: "Checkups",),
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: const CustomTextField(
                label: 'Search Checkup',
                icon: Icons.search,
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text1(text1: 'Upcoming Checkup'),
                  Spacer()
                ],
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
             padding: EdgeInsets.symmetric(horizontal: 8.0),
             child: Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: AppColors.tabColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppTheme.getThemeExtension(context).primaryColor!)),
                          child: Image.asset(
                            'assets/images/img/heart.png',
                            color: AppColors.buttonColor,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text1(text1: 'General CheckUp'),
                                  Spacer(),
                                  Text11(text2: '08-09, 2024')
                                ],
                              ),
                              Text11(
                                text2: 'Completed',
                                color: AppColors.text3Color,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 62),
                      height: 4,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(20)),
                    )
                  ],
                ),
              ),
           ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: AppColors.tabColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppTheme.getThemeExtension(context).primaryColor!)),
                          child: Image.asset(
                            'assets/images/img/heart.png',
                            color: AppColors.buttonColor,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text1(text1: 'General CheckUp'),
                                  Spacer(),
                                  Text11(text2: '08-09, 2024')
                                ],
                              ),
                              Text11(
                                text2: 'Completed',
                                color: AppColors.text3Color,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 62),
                      height: 4,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(20)),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: AppColors.tabColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppTheme.getThemeExtension(context).primaryColor!)),
                          child: Image.asset(
                            'assets/images/img/heart.png',
                            color: AppColors.buttonColor,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text1(text1: 'General CheckUp'),
                                  Spacer(),
                                  Text11(text2: '08-09, 2024')
                                ],
                              ),
                              Text11(
                                text2: 'Completed',
                                color: AppColors.text3Color,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 62),
                      height: 4,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(20)),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text1(text1: 'Completed Checkup'),
                  Spacer()
                ],
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: AppColors.tabColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppTheme.getThemeExtension(context).primaryColor!)),
                          child: Image.asset(
                            'assets/images/img/heart.png',
                            color: AppColors.buttonColor,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text1(text1: 'General CheckUp'),
                                  Spacer(),
                                  Text11(text2: '08-09, 2024')
                                ],
                              ),
                              Text11(
                                text2: 'Completed',
                                color: AppColors.text3Color,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 62),
                      height: 4,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(20)),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: AppColors.tabColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppTheme.getThemeExtension(context).primaryColor!)),
                          child: Image.asset(
                            'assets/images/img/heart.png',
                            color: AppColors.buttonColor,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text1(text1: 'General CheckUp'),
                                  Spacer(),
                                  Text11(text2: '08-09, 2024')
                                ],
                              ),
                              Text11(
                                text2: 'Completed',
                                color: AppColors.text3Color,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 62),
                      height: 4,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(20)),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: AppColors.tabColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppTheme.getThemeExtension(context).primaryColor!)),
                          child: Image.asset(
                            'assets/images/img/heart.png',
                            color: AppColors.buttonColor,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text1(text1: 'General CheckUp'),
                                  Spacer(),
                                  Text11(text2: '08-09, 2024')
                                ],
                              ),
                              Text11(
                                text2: 'Completed',
                                color: AppColors.text3Color,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 62),
                      height: 4,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(20)),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Patient {
  final String name;
  final String phone;
  final String gender;

  Patient({required this.name, required this.phone, required this.gender});
}

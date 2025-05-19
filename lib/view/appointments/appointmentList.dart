import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../widgets/custom/custom_outline_button.dart';
import '../../widgets/custom/custombtn.dart';
import '../../widgets/custom/detailstext1.dart';
import '../../widgets/custom/detailstext2.dart';
import '../../widgets/custom/text11.dart';


class AppointmentList extends StatelessWidget {
  const AppointmentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.tabColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text1(text1: 'Aug 25, 2023 - 10:00 AM',size: 15,),
                        Spacer(),
                        Text2(text2: 'Remind Me'),
                        SizedBox(width: 6,),
                        Icon(Icons.remember_me,color:AppColors.buttonColor,size: 15,)


                      ],


                    ),
                    const SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/img/drjane.jpg',
                            width: 60,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const Text1(
                                text1: 'Dr.Jane Kooper',
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/images/img/MapPin.png',width: 16,),
                                  const SizedBox(width: 4,),
                                  const Text2(text2: '41 Kennedy Gardens,Billingham'),
                                ],
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text2(text2: 'Booking Id'),
                                  Text11(text2: '#R45sfd677',color: AppColors.text3Color,)




                                ],



                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Flexible(child: CustomOutlinedButton(text: 'Cancel', onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => const CanccellBokkkkking()));
                        })),
                         const SizedBox(width: 10,),
                        Flexible(child: CustomButton(text: 'Rescheduled', onTap: () {})),

                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.tabColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text1(text1: 'Aug 25, 2023 - 10:00 AM',size: 15,),
                        Spacer(),
                        Text2(text2: 'Remind Me'),
                        SizedBox(width: 6,),
                        Icon(Icons.remember_me,color:AppColors.buttonColor,size: 15,)


                      ],


                    ),
                    const SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/img/drrobert.jpg',
                            width: 50,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const Text1(
                                text1: 'Dr.Robert Kooper',
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/images/img/MapPin.png',width: 16,),
                                  const SizedBox(width: 4,),
                                  const Text2(text2: '41 Kennedy Gardens,Billingham'),
                                ],
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text2(text2: 'Booking Id'),
                                  Text11(text2: '#R45sfd677',color: AppColors.text3Color,)




                                ],



                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Flexible(child: CustomOutlinedButton(text: 'Cancel', onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => const CanccellBokkkkking()));
                        })),                          const SizedBox(width: 10,),
                        Flexible(child: CustomButton(text: 'Rescheduled', onTap: () {})),

                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.tabColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text1(text1: 'Aug 25, 2023 - 10:00 AM',size: 15,),
                        Spacer(),
                        Text2(text2: 'Remind Me'),
                        SizedBox(width: 6,),
                        Icon(Icons.remember_me,color:AppColors.buttonColor,size: 15,)


                      ],


                    ),
                    const SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/img/doctorwomen.jpg',
                            width: 50,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const Text1(
                                text1: 'Dr.Shazia Jamee',
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/images/img/MapPin.png',width: 16,),
                                  const SizedBox(width: 4,),
                                  const Text2(text2: '41 Kennedy Gardens,Billingham'),
                                ],
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text2(text2: 'Booking Id'),
                                  Text11(text2: '#R45sfd677',color: AppColors.text3Color,)




                                ],



                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Flexible(child: CustomOutlinedButton(text: 'Cancel', onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => const CanccellBokkkkking()));
                        })),                          const SizedBox(width: 10,),
                        Flexible(child: CustomButton(text: 'Rescheduled', onTap: () {})),

                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.tabColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text1(text1: 'Aug 25, 2023 - 10:00 AM',size: 15,),
                        Spacer(),
                        Text2(text2: 'Remind Me'),
                        SizedBox(width: 6,),
                        Icon(Icons.remember_me,color:AppColors.buttonColor,size: 15,)


                      ],


                    ),
                    const SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/img/doctorwomennnnnnnn.jpg',
                            width: 50,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const Text1(
                                text1: 'Dr.Robert Kooper',
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/images/img/MapPin.png',width: 16,),
                                  const SizedBox(width: 4,),
                                  const Text2(text2: '41 Kennedy Gardens,Billingham'),
                                ],
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text2(text2: 'Booking Id'),
                                  Text11(text2: '#R45sfd677',color: AppColors.text3Color,)




                                ],



                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Flexible(child: CustomOutlinedButton(text: 'Cancel', onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => const CanccellBokkkkking()));
                        })),                          const SizedBox(width: 10,),
                        Flexible(child: CustomButton(text: 'Rescheduled', onTap: () {})),

                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.tabColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text1(text1: 'Aug 25, 2023 - 10:00 AM',size: 15,),
                        Spacer(),
                        Text2(text2: 'Remind Me'),
                        SizedBox(width: 6,),
                        Icon(Icons.remember_me,color:AppColors.buttonColor,size: 15,)


                      ],


                    ),
                    const SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'images/drjane.jpg',
                            width: 60,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const Text1(
                                text1: 'Dr.Jane Kooper',
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: [
                                  Image.asset('images/MapPin.png',width: 16,),
                                  const SizedBox(width: 4,),
                                  const Text2(text2: '41 Kennedy Gardens,Billingham'),
                                ],
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text2(text2: 'Booking Id'),
                                  Text11(text2: '#R45sfd677',color: AppColors.text3Color,)




                                ],



                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Flexible(child: CustomOutlinedButton(text: 'Cancel', onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => const CanccellBokkkkking()));
                        })),                          const SizedBox(width: 10,),
                        Flexible(child: CustomButton(text: 'Rescheduled', onTap: () {})),

                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),


            ],
          ),
        ),
      ),
    );
  }
}

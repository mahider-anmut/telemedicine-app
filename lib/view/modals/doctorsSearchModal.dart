import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../widgets/custom/chiipppp.dart';
import '../../widgets/custom/custombtn.dart';
import '../../widgets/custom/detailstext1.dart';
import '../../widgets/custom/detailstext2.dart';
import '../../widgets/custom/text11.dart';


class DoctorSearchModal extends StatelessWidget {
  const DoctorSearchModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [

                      const Spacer(),
                      const Text1(text1: 'Doctors'),
                      const Spacer(),

                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Chipppp(text: 'All'),
                        SizedBox(width: 10,),
                        Chipppp(text: 'Dentist',color: AppColors.buttonColor,),
                        SizedBox(width: 10,),
                        Chipppp(text: 'Cardiologist'),
                        SizedBox(width: 10,),
                        Chipppp(text: 'Nurologist'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6,
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/images/img/drjane.jpg',
                                width: 80,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        width: 150,
                                        decoration: BoxDecoration(
                                            color: AppColors.bgColor,
                                            borderRadius: BorderRadius.circular(8)),
                                        child: const Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 8,
                                              backgroundColor: AppColors.buttonColor,
                                              child: Icon(
                                                Icons.check,
                                                color: Colors.white,
                                                size: 10,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text11(
                                              text2: ' Doctor',
                                              color: AppColors.buttonColor,
                                            )
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.favorite,
                                        color: AppColors.buttonColor,
                                        size: 21,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  const Text1(
                                    text1: 'Dr.Jane Kooper',
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  const Text2(text2: 'Dentist'),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: AppColors.buttonColor,
                                        size: 20,
                                      ),
                                      const Icon(
                                        Icons.star,
                                        color: AppColors.buttonColor,
                                        size: 20,
                                      ),
                                      const Icon(
                                        Icons.star,
                                        color: AppColors.buttonColor,
                                        size: 20,
                                      ),
                                      const Icon(
                                        Icons.star,
                                        color: AppColors.buttonColor,
                                        size: 20,
                                      ),
                                      const Icon(
                                        Icons.star,
                                        color: AppColors.buttonColor,
                                        size: 20,
                                      ),
                                      const Text1(text1: '4.6'),
                                      const Spacer(),
                                      Container(
                                        color: Colors.white,
                                        width: 1,
                                        height: 16,
                                      ),
                                      const Spacer(),
                                      const Text2(text2: '49 Reviews')
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 8,),
                        CustomButton(text: 'Make Appointment', onTap: () {
                          // Navigator.of(context).push(
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             const BookAppointment()));

                        })                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                ],
              ),
            ),
          )),
    );
  }
}

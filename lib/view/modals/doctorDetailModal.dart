import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../widgets/custom/chiipppp.dart';
import '../../widgets/custom/custombtn.dart';
import '../../widgets/custom/customtextfield.dart';
import '../../widgets/custom/detailstext1.dart';
import '../../widgets/custom/detailstext2.dart';
import '../../widgets/custom/text11.dart';


class DoctorDetailModal extends StatelessWidget {
  const DoctorDetailModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [

                  const Spacer(),
                  const Text1(text1: 'Doctor Details'),
                  const Spacer(),


                ],
              ),
              const SizedBox(
                height: 23,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: AppColors.tabColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/img/doccc.jpg',
                          width: 65,
                          height:
                              65, // Specify height to keep the image circular
                          fit: BoxFit
                              .cover, // Ensure the image covers the circular area
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 17,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 2),
                          child: Text1(text1: 'Dr.Alyan '),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 2, top: 4),
                          child: Text2(text2: 'Dentist Consultation'),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/img/MapPin.png',
                              color: Colors.white,
                              width: 17,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            const Text2(text2: 'New York ,USA'),
                            const SizedBox(
                              width: 4,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 7),
                              child: Image.asset(
                                'assets/images/img/arrow.png',
                                color: Colors.white,
                                width: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 22,
                          child: Image.asset(
                            'assets/images/img/icons8-patients-64.png',
                            width: 30,
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text1(
                        text1: '7,5000+',
                        color: AppColors.buttonColor,
                        size: 15,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text1(
                        text1: 'Patients',
                        size: 11,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 22,
                          child: Image.asset(
                            'assets/images/img/icons8-experience-48.png',
                            width: 30,
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text1(
                        text1: '10+',
                        color: AppColors.buttonColor,
                        size: 15,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text1(
                        text1: 'Experience',
                        size: 11,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 22,
                          child: Image.asset(
                            'assets/images/img/icons8-rating-48.png',
                            width: 30,
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text1(
                        text1: '4.9+',
                        color: AppColors.buttonColor,
                        size: 15,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text1(
                        text1: 'Rating',
                        size: 11,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 22,
                          child: Image.asset(
                            'assets/images/img/icons8-reviews-64.png',
                            width: 30,
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text1(
                        text1: '4,956',
                        color: AppColors.buttonColor,
                        size: 15,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text1(
                        text1: 'Reviews',
                        size: 11,
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text1(
                text1: 'About',
                size: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text2(
                  text2:
                      'Doctors act as guardians of our health, diagnosing and treating illnesses with a blend of knowledge and skill. They stand at the forefront of medicine.'),
              const SizedBox(
                height: 10,
              ),
              const Text1(
                text1: 'Working Hours',
                size: 20,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: AppColors.tabColor,
                    borderRadius: BorderRadius.circular(8)),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        children: [
                          Text2(text2: 'Monday'),
                          Spacer(),
                          Text11(text2: '00:00 - 00:00')
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        children: [
                          Text2(text2: 'Tuesday'),
                          Spacer(),
                          Text11(text2: '00:00 - 00:00')
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        children: [
                          Text2(text2: 'Wednesday'),
                          Spacer(),
                          Text11(text2: '00:00 - 00:00')
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        children: [
                          Text2(text2: 'Thursday'),
                          Spacer(),
                          Text11(text2: '00:00 - 00:00')
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        children: [
                          Text2(text2: 'Friday'),
                          Spacer(),
                          Text11(text2: '00:00 - 00:00')
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        children: [
                          Text2(text2: 'Saturday'),
                          Spacer(),
                          Text11(text2: '00:00 - 00:00')
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        children: [
                          Text2(text2: 'Sunday'),
                          Spacer(),
                          Text11(text2: '00:00 - 00:00')
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
        child: CustomButton(text: 'Book Appointment',onTap: (){

          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => const BookAppointment()));
    }
        )
      ),
    );

  }
}


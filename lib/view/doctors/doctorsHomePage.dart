import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../widgets/custom/custombtn.dart';
import '../../widgets/custom/customtextfield.dart';
import '../../widgets/custom/detailstext1.dart';
import '../../widgets/custom/detailstext2.dart';
import '../../widgets/custom/text11.dart';
import '../../widgets/headerMiniCardWidget.dart';
import '../modals/doctorDetailModal.dart';
import '../modals/doctorSpecialityModal.dart';
import '../modals/doctorsSearchModal.dart';


class DoctorsHomePage extends StatelessWidget {
  const DoctorsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const HeaderMiniCardWidget(title: "Doctors",),
        SizedBox(height: 8.0),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: CustomTextField(
            label: 'Search Doctors',
            icon: Icons.search,
          ),
        ),
        const SizedBox(height: 8.0),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text1(text1: 'Doctor Speciality '),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32.0),
                        topRight: Radius.circular(32.0),
                      ),
                    ),
                    builder: (context) =>  DoctorSpecialityModal(),
                  );
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => DoctorSpecialityList()));
                },
                child: const Text11(
                  text2: 'See All',
                  color: AppColors.text3Color,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 22,
                        child: Image.asset(
                          'assets/images/img/icons8-dentist-48.png',
                          width: 30,
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text1(
                      text1: 'Dentist',
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
                          'assets/images/img/icons8-cardiologist-64.png',
                          width: 30,
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text1(
                      text1: 'Cardiolo..',
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
                          'assets/images/img/icons8-neurologist-64.png',
                          width: 30,
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text1(
                      text1: 'Neurolo..',
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
                          'assets/images/img/icons8-orthopedic-64.png',
                          width: 30,
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text1(
                      text1: 'Orthopae..',
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
                          'assets/images/img/icons8-cardiologist-64.png',
                          width: 30,
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text1(
                      text1: 'Cardiolo..',
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
                          'assets/images/img/icons8-cardiologist-64.png',
                          width: 30,
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text1(
                      text1: 'Neurolo..',
                      size: 11,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const DoctorSearchModal()));
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text1(text1: 'Top Doctors '),
                Text11(
                  text2: 'See All',
                  color: AppColors.text3Color,
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
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
                                      backgroundColor:
                                          AppColors.buttonColor,
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
                                      text2: 'Doctor Ali',
                                      color: AppColors.buttonColor,
                                    )
                                  ],
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  // Navigator.of(context).push(
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             const FavoritesScreen()));
                                },
                                child: const Icon(
                                  Icons.favorite_border_outlined,
                                  color: Colors.red,
                                  size: 21,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          const Text1(
                            text1: 'Dr.Jane Doe',
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
                const SizedBox(
                  height: 8,
                ),
                CustomButton(text: 'Make Appointment', onTap: () {
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             const BookAppointment()));

                })                  ],
            ),
          ),
        ),
        const SizedBox(height: 16.0),


        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text1(text1: 'Nearby Doctors'),
              InkWell(

                child: Text11(
                  text2: 'See All',
                  color: AppColors.text3Color,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
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
                              InkWell(
                                onTap:(){
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const DoctorDetailModal()));
                                },
                                child: Container(
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
                                        backgroundColor:
                                        AppColors.buttonColor,
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
                                        text2: 'Doctor Ali',
                                        color: AppColors.buttonColor,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  // Navigator.of(context).push(
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             const FavoritesScreen()));
                                },
                                child: const Icon(
                                  Icons.favorite_border_outlined,
                                  color: Colors.red,
                                  size: 21,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          const Text1(
                            text1: 'Dr.Jane Doe',
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
                const SizedBox(
                  height: 8,
                ),
                CustomButton(text: 'Make Appointment', onTap: () {
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             const BookAppointment()));

                })                  ],
            ),
          ),
        ),
      ],
              ),
            ),
    );
  }
}

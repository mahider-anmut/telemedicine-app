import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../widgets/custom/custombtn.dart';
import '../../widgets/custom/customtextfield.dart';
import '../../widgets/custom/detailstext1.dart';
import '../../widgets/custom/detailstext2.dart';

class PrescriptionDetailModal extends StatelessWidget {
  const PrescriptionDetailModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  const Text1(text1: 'Select Tests'),
                  const Spacer(),
                  const Text1(text1: '')
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextField(
                label: 'Search tests',
                icon: Icons.search,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text1(
                text1: 'Frequently Booked Tests',
                size: 17,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: AppColors.tabColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text1(
                            text1: '2020 Novel Carona Virus - RTPCR',
                            size: 14,
                          ),
                          Spacer(),
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.check,
                              color: AppColors.buttonColor,
                              size: 15,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Text2(text2: 'Reports within'),
                              Text1(
                                text1: '  6 hours',
                                size: 16,
                              ),
                            ],
                          ),
                          Spacer(),
                          Text1(
                            text1: '\$4500',
                            size: 16,
                          ),
                        ],
                      ),
                    ],
                  )),
              Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: AppColors.tabColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text1(
                            text1: 'Complete Blood Count(CBC)',
                            size: 14,
                          ),
                          Spacer(),
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.check,
                              color: AppColors.buttonColor,
                              size: 15,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text2(text2: 'Reports within'),
                              Text1(
                                text1: '  9 hours',
                                size: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                      LineRow(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text1(
                            text1: 'Includes:',
                            size: 16,
                          ),
                          Spacer(),
                        ],
                      ),
                      Text2(text2: 'Red blood cell count(RBC)'),
                      Text2(text2: 'Hb - Haemglobin'),
                      Row(
                        children: [
                          Row(
                            children: [
                              Text2(text2: 'Haemotocrit & '),
                              Text1(
                                text1: '12 more tests',
                                size: 16,
                              )
                            ],
                          ),
                          Spacer(),
                          Text1(
                            text1: '\$50000',
                            size: 16,
                          )
                        ],
                      ),
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: AppColors.tabColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text1(
                            text1: 'Glycosylated Haemoglobin(HbA1c)',
                            size: 14,
                          ),
                          const Spacer(),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Row(
                        children: [
                          Row(
                            children: [
                              Text2(text2: 'Reports within'),
                              Text1(
                                text1: '  6 hours',
                                size: 16,
                              ),
                            ],
                          ),
                          Spacer(),
                          Text1(
                            text1: '\$4500',
                            size: 16,
                          ),
                        ],
                      ),
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: AppColors.tabColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text1(
                            text1: 'Fasting Blood Sugar(FBS)',
                            size: 14,
                          ),
                          const Spacer(),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Row(
                        children: [
                          Row(
                            children: [
                              Text2(text2: 'Reports within'),
                              Text1(
                                text1: '  6 hours',
                                size: 16,
                              ),
                            ],
                          ),
                          Spacer(),
                          Text1(
                            text1: '\$4500',
                            size: 16,
                          ),
                        ],
                      ),
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: AppColors.tabColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text1(
                            text1: 'Throid Funtion Test(TFT)',
                            size: 14,
                          ),
                          const Spacer(),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Row(
                        children: [
                          Row(
                            children: [
                              Text2(text2: 'Reports within'),
                              Text1(
                                text1: '  6 hours',
                                size: 16,
                              ),
                            ],
                          ),
                          Spacer(),
                          Text1(
                            text1: '\$4500',
                            size: 16,
                          ),
                        ],
                      ),
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: AppColors.tabColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text1(
                            text1: 'Glycosylated Haemoglobin(HbA1c)',
                            size: 14,
                          ),
                          const Spacer(),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Row(
                        children: [
                          Row(
                            children: [
                              Text2(text2: 'Reports within'),
                              Text1(
                                text1: '  6 hours',
                                size: 16,
                              ),
                            ],
                          ),
                          Spacer(),
                          Text1(
                            text1: '\$4500',
                            size: 16,
                          ),
                        ],
                      ),
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: AppColors.tabColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text1(
                            text1: 'Fasting Blood Sugar(FBS)',
                            size: 14,
                          ),
                          const Spacer(),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Row(
                        children: [
                          Row(
                            children: [
                              Text2(text2: 'Reports within'),
                              Text1(
                                text1: '  6 hours',
                                size: 16,
                              ),
                            ],
                          ),
                          Spacer(),
                          Text1(
                            text1: '\$4500',
                            size: 16,
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 14),
        child: CustomButton(text: 'Make Payment', onTap:(){}),
      ),
    );
  }
}

class LineRow extends StatelessWidget {
  const LineRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
          Linnnnn2(),
        ],
      ),
    );
  }
}

class Linnnnn2 extends StatelessWidget {
  const Linnnnn2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.only(right: 2),
      height: 3,
      width: 4,
    );
  }
}

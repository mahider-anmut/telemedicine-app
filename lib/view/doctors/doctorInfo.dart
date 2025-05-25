import 'package:flutter/material.dart';
import 'package:telemedicine/constants/assets.dart';
import 'package:telemedicine/model/User.dart';
import 'package:telemedicine/view/modals/addAppointmentModal.dart';
import 'package:telemedicine/widgets/ratingStarsWidget.dart';

import '../../constants/colors.dart';
import '../../dto/Doctor.dart';
import '../../widgets/custom/custombtn.dart';
import '../../widgets/custom/detailstext1.dart';
import '../../widgets/custom/detailstext2.dart';
import '../../widgets/custom/text11.dart';

class DoctorInfo extends StatefulWidget {
  final Doctor doctor;
  const DoctorInfo({super.key,required this.doctor});

  @override
  State<DoctorInfo> createState() => _DoctorInfoState();
}

class _DoctorInfoState extends State<DoctorInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: widget.doctor.userInfo?.profileImage != null?Image.network(widget.doctor.userInfo!.profileImage!):Image.asset(LocalAssets.avatar, width: 80,),
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
                          padding:  EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          width: 218,
                          decoration: BoxDecoration(
                              color: AppColors.bgColor,
                              borderRadius: BorderRadius.circular(8)),
                          child:  Row(
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
                              SizedBox(
                                width: 160,
                                child: Text("Dr. ${widget.doctor.userInfo?.firstName} ${widget.doctor.userInfo?.lastName}",style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.buttonColor
                                ),overflow: TextOverflow.ellipsis),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text1(
                      text1: "+ ${widget.doctor.medicalProfile?.yearsOfExperience} year(s) Experience",
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text2(text2: "${widget.doctor.medicalProfile?.specialty}"),
                    const SizedBox(
                      height: 2,
                    ),

                  ],
                ),
              )
            ],
          ),
                         ],
      ),
    );
  }
}

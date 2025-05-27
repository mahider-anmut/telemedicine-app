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

class DoctorSearchItem extends StatefulWidget {
  final Doctor doctor;
  const DoctorSearchItem({super.key,required this.doctor});

  @override
  State<DoctorSearchItem> createState() => _DoctorSearchItemState();
}

class _DoctorSearchItemState extends State<DoctorSearchItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
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
                    Text1(
                      text1: "Dr. ${widget.doctor.userInfo?.firstName} ${widget.doctor.userInfo?.lastName}",
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text2(
                      text2: "${widget.doctor.medicalProfile?.specialty} for +${widget.doctor.medicalProfile?.yearsOfExperience} year(s)",
                    ),

                    // RatingStarsWidget(rating: widget.doctor.statistics!.avgRating!),
                    CustomButton(height:32,text: 'Make Appointment', onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32.0),
                            topRight: Radius.circular(32.0),
                          ),
                        ),
                        builder: (context) => AddAppointmentModal(doctor: widget.doctor),
                      );

                    })
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 8,),
                             ],
      ),
    );
  }
}

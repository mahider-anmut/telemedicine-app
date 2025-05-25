import 'package:flutter/material.dart';
import 'package:telemedicine/constants/assets.dart';
import 'package:telemedicine/model/Appointment.dart';
import 'package:telemedicine/model/User.dart';
import 'package:telemedicine/utils/utils.dart';
import 'package:telemedicine/view/modals/addAppointmentModal.dart';
import 'package:telemedicine/widgets/ratingStarsWidget.dart';

import '../../constants/colors.dart';
import '../../controller/appointmentController.dart';
import '../../dto/Doctor.dart';
import '../../widgets/custom/custom_outline_button.dart';
import '../../widgets/custom/custombtn.dart';
import '../../widgets/custom/detailstext1.dart';
import '../../widgets/custom/detailstext2.dart';
import '../../widgets/custom/text11.dart';

class AppointmentItem extends StatefulWidget {
  final Appointment appointment;
  Function fetchAppointments;

  AppointmentItem({super.key,required this.appointment,required this.fetchAppointments});

  @override
  State<AppointmentItem> createState() => _AppointmentItemState();
}

class _AppointmentItemState extends State<AppointmentItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text1(text1: "${widget.appointment.appointmentDate!.split("T")[0]}  ${widget.appointment.appointmentTime}",size: 15,),
                        Spacer(),
                        Text2(text2: Utils.capitalize(widget.appointment.appointmentStatus!)),
                        SizedBox(width: 6,)
                      ],


                    ),
                    const SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: widget.appointment.patient?.profileImage != null?Image.network(widget.appointment.patient!.profileImage!):Image.asset(LocalAssets.avatar, width: 60,),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text1(
                                text1: "${widget.appointment.patient?.firstName} ${widget.appointment.patient?.lastName}",
                              ),
                              Row(
                                children: [
                                  const SizedBox(width: 4,),
                                  Text2(text2: widget.appointment.title!),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // Text2(text2: 'Booking Id'),
                                  Spacer(),
                                  Text11(text2: '#${widget.appointment.id!.substring(widget.appointment.id!.length - 9)}',color: AppColors.text3Color,)
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
                        Flexible(child: CustomOutlinedButton(text: 'Cancel', onTap: () async {
                          await AppointmentController.updateStatus(context,widget.appointment.id!,"cancelled");
                          widget.fetchAppointments();
                        })),
                         const SizedBox(width: 10,),
                        Flexible(child: CustomButton(text: 'Open Chat', onTap: () {})),

                      ],
                    )
                  ],
                ),
              )
    );
  }
}

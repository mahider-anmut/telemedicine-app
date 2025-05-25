import 'package:flutter/material.dart';
import 'package:telemedicine/view/appointments/appointmentItem.dart';

import '../../constants/colors.dart';
import '../../model/Appointment.dart';

class AppointmentList extends StatefulWidget {
  final List<Appointment> appointments;
  Function fetchAppointments;

  AppointmentList({super.key, required this.appointments,required this.fetchAppointments});

  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  @override
  Widget build(BuildContext context) {
    if (widget.appointments.isEmpty) {
      // 👇 Make the empty state scrollable to enable pull-to-refresh
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: const [
          SizedBox(height: 200), // Optional spacing to help show swipe
          Center(child: Text("No appointments")),
        ],
      );
    }

    return ListView.builder(
      itemCount: widget.appointments.length,
      itemBuilder: (context, index) {
        final appointment = widget.appointments[index];
        return AppointmentItem(appointment: appointment,fetchAppointments:widget.fetchAppointments);
      },
    );
  }
}

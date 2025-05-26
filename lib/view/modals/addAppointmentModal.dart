
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:telemedicine/controller/appointmentController.dart';
import 'package:telemedicine/controller/doctorController.dart';
import 'package:telemedicine/controller/scheduleController.dart';
import 'package:telemedicine/dto/Slot.dart';
import 'package:telemedicine/service/shared_preference.dart';
import 'package:telemedicine/view/doctors/doctorInfo.dart';

import '../../constants/constants.dart';
import '../../dto/Doctor.dart';
import '../../model/Appointment.dart';
import '../../widgets/customElevatedButton.dart';
import '../doctors/doctorItem.dart';


class AddAppointmentModal extends StatefulWidget {
  final Doctor doctor;

  const AddAppointmentModal({
    super.key,
    required this.doctor
  });

  @override
  State<AddAppointmentModal> createState() => _AddAppointmentModalState();
}

class _AddAppointmentModalState extends State<AddAppointmentModal> {
  DateTime? _selectedDate;
  List<String> _availableSlots = [];
  String? _selectedSlot;
  int? _sessionDuration;
  double? _sessionPrice;
  final TextEditingController _titleController = TextEditingController();

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _selectedSlot = null;
        _availableSlots = [];
      });
      _loadSlots(picked);
    }
  }

  void _loadSlots(DateTime date) async {
    Slot slots = await ScheduleController.getAvailableSlots(widget.doctor.userInfo!.id!,DateFormat('yyyy-MM-dd').format(date));
    setState(() {
      _availableSlots = slots.availableSlots!;
      _sessionDuration = slots.sessionDuration!;
      _sessionPrice = slots.sessionPrice!;
    });
  }

  Future<void> _save() async {
    if (_selectedDate != null && _selectedSlot != null && _titleController.text.isNotEmpty) {
      String userId = await SharedPreference.getString(Constants.userId);
      final appointment = Appointment(
        doctorId: widget.doctor.userInfo?.id,
        patientId:  userId,
        title: _titleController.text,
        appointmentDate: DateFormat('yyyy-MM-dd').format(_selectedDate!),
        appointmentTime: _selectedSlot!,
        sessionPrice: _sessionPrice!,
        sessionDuration: _sessionDuration!,
        sessionTime: "${_selectedSlot?.split(" - ")[0]}",
        appointmentStatus: "pending"
      );

      await AppointmentController.createAppointment(context,appointment);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.0),
            topRight: Radius.circular(32.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DoctorInfo(doctor: widget.doctor),
            const SizedBox(height: 8),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Appointment Title',
                  border: OutlineInputBorder(),
                ),
              ),
            const SizedBox(height: 16),
            TextButton.icon(
              onPressed: _pickDate,
              icon: const Icon(Icons.calendar_today),
              label: Text(_selectedDate == null
                  ? "Select Date"
                  : DateFormat.yMMMd().format(_selectedDate!)),
            ),
            const SizedBox(height: 8),
            if (_selectedDate != null)
              _availableSlots.isEmpty
                  ? const Text("No slots available", style: TextStyle(color: Colors.grey))
                  : Wrap(
                spacing: 8,
                children: _availableSlots.map((slot) {
                  final isSelected = slot == _selectedSlot;
                  return ChoiceChip(
                    label: Text(slot),
                    selected: isSelected,
                    onSelected: (_) {
                      setState(() => _selectedSlot = slot);
                    },
                  );
                }).toList(),
              ),
            const Spacer(),
            if (_selectedSlot != null)
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(label: "save Appointment", onPressed: _save),
              )
          ],
        ),
      ),
    );
  }
}

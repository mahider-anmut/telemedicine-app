import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants/colors.dart';
import '../../model/Schedule.dart';
import '../../widgets/custom/chiipppp.dart';
import '../../widgets/custom/custombtn.dart';
import '../../widgets/custom/customtextfield.dart';
import '../../widgets/custom/detailstext1.dart';
import '../../widgets/custom/detailstext2.dart';
import '../../widgets/custom/text11.dart';

//
// class AddWeeklyScheduleModal extends StatefulWidget {
//   final WeeklySchedule schedule;
//   const AddWeeklyScheduleModal({super.key, required this.schedule});
//
//   @override
//   State<AddWeeklyScheduleModal> createState() => _AddWeeklyScheduleModalState();
// }
//
// class _AddWeeklyScheduleModalState extends State<AddWeeklyScheduleModal> {
//
//   final Map<String, List<String>> _slots = {};
//   final List<String> _days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
//
//   TimeOfDay? _startTime;
//   TimeOfDay? _endTime;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeSlots();
//   }
//
//   void _initializeSlots() {
//     _slots['Monday'] = widget.schedule.monday ?? [];
//     _slots['Tuesday'] = widget.schedule.tuesday ?? [];
//     _slots['Wednesday'] = widget.schedule.wednesday ?? [];
//     _slots['Thursday'] = widget.schedule.thursday ?? [];
//     _slots['Friday'] = widget.schedule.friday ?? [];
//     _slots['Saturday'] = widget.schedule.saturday ?? [];
//     _slots['Sunday'] = widget.schedule.sunday ?? [];
//   }
//
//   Future<void> _pickTime(bool isStart) async {
//     final picked = await showTimePicker(
//       context: context,
//       initialTime: isStart ? (_startTime ?? TimeOfDay.now()) : (_endTime ?? TimeOfDay.now()),
//     );
//     if (picked != null) {
//       setState(() {
//         if (isStart) {
//           _startTime = picked;
//         } else {
//           _endTime = picked;
//         }
//       });
//     }
//   }
//
//   void _addTimeSlot(String day) {
//     if (_startTime != null && _endTime != null) {
//       final slot = '${_startTime!.format(context)} - ${_endTime!.format(context)}';
//       setState(() {
//         _slots[day]?.add(slot);
//         _startTime = null;
//         _endTime = null;
//       });
//     }
//   }
//
//   void _save() {
//     final updated = WeeklySchedule(
//       monday: _slots['Monday'],
//       tuesday: _slots['Tuesday'],
//       wednesday: _slots['Wednesday'],
//       thursday: _slots['Thursday'],
//       friday: _slots['Friday'],
//       saturday: _slots['Saturday'],
//       sunday: _slots['Sunday'],
//     );
//     Navigator.pop(context, updated);
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       height: MediaQuery.of(context).size.height * 0.8,
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(32.0),
//           topRight: Radius.circular(32.0),
//         ),
//       ),
//       child: ListView(
//           padding: const EdgeInsets.all(16),
//           children: [
//             ..._days.map((day) => Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(day, style: Theme.of(context).textTheme.titleMedium),
//                 Wrap(
//                   spacing: 8,
//                   children: _slots[day]!
//                       .map((slot) => Chip(label: Text(slot)))
//                       .toList(),
//                 ),
//                 Row(
//                   children: [
//                     TextButton(
//                       onPressed: () => _pickTime(true),
//                       child: Text(_startTime == null ? "Start Time" : _startTime!.format(context)),
//                     ),
//                     Text(" - "),
//                     TextButton(
//                       onPressed: () => _pickTime(false),
//                       child: Text(_endTime == null ? "End Time" : _endTime!.format(context)),
//                     ),
//                     IconButton(
//                       onPressed: () => _addTimeSlot(day),
//                       icon: const Icon(Icons.add),
//                     ),
//                   ],
//                 ),
//                 const Divider(),
//               ],
//             )),
//             ElevatedButton.icon(
//               onPressed: _save,
//               icon: const Icon(Icons.save),
//               label: const Text("Save Weekly Schedule"),
//             )
//           ],
//         ),
//     );
//   }
// }
//

import 'package:flutter/material.dart';
import '../../model/Schedule.dart';

class AddExceptionScheduleModal extends StatefulWidget {
  final List<ExceptionSlot> exceptions;
  final Function(List<ExceptionSlot>) updateExceptionsList;
  const AddExceptionScheduleModal({super.key, required this.exceptions,required this.updateExceptionsList});

  @override
  State<AddExceptionScheduleModal> createState() => _AddExceptionScheduleModalState();
}

class _AddExceptionScheduleModalState extends State<AddExceptionScheduleModal> {
  final Map<DateTime, List<String>> _exceptionMap = {};
  DateTime? _selectedDate;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;

  @override
  void initState() {
    super.initState();
    for (final ex in widget.exceptions ?? []) {
      _exceptionMap[ex.date!] = [...ex.timeSlots ?? []];
    }
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  Future<void> _pickTime(bool isStart) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startTime = picked;
        } else {
          _endTime = picked;
        }
      });
    }
  }

  void _addExceptionSlot() {
    if (_selectedDate != null && _startTime != null && _endTime != null) {
      final slot = '${_startTime!.format(context)} - ${_endTime!.format(context)}';
      setState(() {
        _exceptionMap.putIfAbsent(_selectedDate!, () => []).add(slot);
        _startTime = null;
        _endTime = null;
      });
    }
  }

  void _save() {
    final updated = _exceptionMap.entries
        .map((e) => ExceptionSlot(date: e.key, timeSlots: e.value))
        .toList();

    widget.updateExceptionsList(updated);

    Navigator.pop(context, updated);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
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
          SizedBox(
            height: 180,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                TextButton(
                  onPressed: _pickDate,
                  child: Text(_selectedDate == null
                      ? "Select Date"
                      : DateFormat.yMMMd().format(_selectedDate!)),
                ),
                if (_selectedDate != null) ...[
                  SizedBox(
                    height: 80,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        spacing: 8,
                        children: _exceptionMap[_selectedDate!]
                            ?.map((slot) => Chip(label: Text(slot)))
                            .toList() ??
                            [],
                      ),
                    ),
                  ),

                ]
              ],
            ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () => _pickTime(true),
                child: Text(_startTime == null ? "Start Time" : _startTime!.format(context)),
              ),
              const Text(" - "),
              TextButton(
                onPressed: () => _pickTime(false),
                child: Text(_endTime == null ? "End Time" : _endTime!.format(context)),
              ),
              Spacer(),
              TextButton.icon(
                onPressed: _addExceptionSlot,
                icon: const Icon(Icons.add, color: Colors.lightBlue),
                label: const Text("Add Slot", style: TextStyle(color: Colors.lightBlue)),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Spacer(),
              ElevatedButton.icon(
                onPressed: _save,
                icon: const Icon(Icons.save),
                label: const Text("Save"),
              ),
              Spacer()
            ],
          )
        ],
      ),
    );
  }
}



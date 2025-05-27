import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:telemedicine/controller/scheduleController.dart';
import 'package:telemedicine/view/modals/addWeeklyScheduleModal.dart';

import '../../model/Schedule.dart';
import '../../utils/utils.dart';
import '../../widgets/headerMiniCardWidget.dart';
import '../modals/addExceptionScheduleModal.dart';

class DoctorSchedulePage extends StatefulWidget {
  const DoctorSchedulePage({super.key});

  @override
  State<DoctorSchedulePage> createState() => _DoctorSchedulePageState();
}

class _DoctorSchedulePageState extends State<DoctorSchedulePage> {
  Schedule? schedule;
  final _durationController = TextEditingController();
  final _priceController = TextEditingController();

  bool isLoading = true;
  bool _weeklyExpanded = true;
  bool _exceptionExpanded = false;

  @override
  void initState() {
    super.initState();
    _loadSchedule();
  }

  Future<void> _loadSchedule() async {
    try {
      schedule = await ScheduleController.fetchSchedule();
    } catch (e) {
      schedule = Schedule();
    }

    _durationController.text = schedule?.sessionDuration?.toString() ?? '';
    _priceController.text = schedule?.sessionPrice?.toStringAsFixed(2) ?? '';
    setState(() => isLoading = false);
  }

  Future<void> _saveSetup() async {
    final duration = int.tryParse(_durationController.text);
    final price = double.tryParse(_priceController.text);
    if (duration != null && price != null) {
      await ScheduleController.updateSetup(context, schedule?.id, duration, price);
      _loadSchedule();
    }else{
      Utils.showSnackBar(context,"Duration and Session Price can not be empty !",type: "error");
    }
  }

  Future<void> _saveWeeklySchedule() async {
      await ScheduleController.updateWeeklySchedule(context,schedule!.id!, schedule!.weeklySchedule!);
      _loadSchedule();
  }

  Future<void> _saveExceptionSchedule() async {
    await ScheduleController.updateExceptionSchedule(context,schedule!.id!, schedule!.exceptions!);
    _loadSchedule();
  }



  Future<void> _editWeeklySchedule() async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
      ),
      builder: (context) =>  AddWeeklyScheduleModal(schedule: schedule!.weeklySchedule ?? WeeklySchedule(),updateScheduleList: (updatedSchedule) {
        setState(() {
          schedule!.weeklySchedule = updatedSchedule;
        });
      }),
    );
  }

  Future<void> _editExceptions() async {

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
      ),
      builder: (context) =>  AddExceptionScheduleModal(exceptions: schedule!.exceptions ?? [],updateExceptionsList: (updatedExceptions) {
        setState(() {
          schedule!.exceptions = updatedExceptions;
        });
      }),
    );

    // final updated = await Navigator.push(context, MaterialPageRoute(
    //   builder: (_) => ExceptionsEditor(schedule: schedule!),
    // ));
    // if (updated != null) _loadSchedule();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final setupExists = schedule?.sessionDuration != null && schedule?.sessionPrice != null;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderMiniCardWidget(title: "Manage Schedule"),
          const SizedBox(height: 8.0),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const HeaderMiniCardWidget(title: "Manage Schedule",),
                  // SizedBox(height: 8.0),
                  // Session Setup Card
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      elevation: 6,
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionTitle("Session Setup"),
                            Row(
                              children: [
                                Expanded(child: _buildInputField("Duration (min)", _durationController)),
                                const SizedBox(width: 8),
                                Expanded(child: _buildInputField("Price (ETB)", _priceController)),
                              ],
                            ),
                            const SizedBox(height: 16),
            
                            Row(
                              children: [
                                Spacer(),
                                ElevatedButton.icon(
                                  onPressed: _saveSetup,
                                  icon: const Icon(Icons.save),
                                  label: const Text("Save"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            
                  // Schedule Card (shown only if setup exists)
                  if (setupExists)
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16,left: 8,right: 8),
                        child: ExpansionPanelList(
                          expansionCallback: (int index, bool isExpanded) {
                            setState(() {
                              if (index == 0) _weeklyExpanded = !_weeklyExpanded;
                              if (index == 1) _exceptionExpanded = !_exceptionExpanded;
                            });
                          },
                          children: [
                            ExpansionPanel(
                              isExpanded: _weeklyExpanded,
                              headerBuilder: (context, isExpanded) => ListTile(
                                title: const Text("Weekly Schedule"),
                              ),
                              body: Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                                      child: previewWeeklySchedule(schedule?.weeklySchedule ?? WeeklySchedule()),
                                    ),
            
                                    const SizedBox(height: 16),
            
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                                          child: ElevatedButton.icon(
                                            onPressed: _editWeeklySchedule,
                                            icon: const Icon(Icons.edit),
                                            label: const Text("Edit"),
                                          ),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                                          child: ElevatedButton.icon(
                                            onPressed: _saveWeeklySchedule,
                                            icon: const Icon(Icons.save),
                                            label: const Text("Save"),
                                          ),
                                        )
                                      ],
                                    ),
            
                                  ],
                                ),
                              ),
                            ),
                            ExpansionPanel(
                              isExpanded: _exceptionExpanded,
                              headerBuilder: (context, isExpanded) => ListTile(
                                title: const Text("Exception Days"),
                              ),
                              body: Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                                      child: previewExceptionSchedule(schedule?.exceptions ?? []),
                                    ),
                                    const SizedBox(height: 16),
            
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                                          child: ElevatedButton.icon(
                                            onPressed: _editExceptions,
                                            icon: const Icon(Icons.edit),
                                            label: const Text("Edit"),
                                          ),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                                          child: ElevatedButton.icon(
                                            onPressed: _saveExceptionSchedule,
                                            icon: const Icon(Icons.save),
                                            label: const Text("Save"),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(title, style: Theme.of(context).textTheme.titleMedium),
    );
  }

  Widget _buildReadOnlyField(String label, String content) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(content.isEmpty ? "No data" : content),
    );
  }

  // String _previewWeeklySchedule(WeeklySchedule weekly) {
  //   final days = {
  //     'Mon': weekly.monday,
  //     'Tue': weekly.tuesday,
  //     'Wed': weekly.wednesday,
  //     'Thu': weekly.thursday,
  //     'Fri': weekly.friday,
  //     'Sat': weekly.saturday,
  //     'Sun': weekly.sunday,
  //   };
  //   return days.entries.map((e) => "${e.key}: ${e.value?.join(', ') ?? ''}").join('\n');
  // }

  Widget previewWeeklySchedule(WeeklySchedule weekly) {
    final days = {
      'Mon': weekly.monday,
      'Tue': weekly.tuesday,
      'Wed': weekly.wednesday,
      'Thu': weekly.thursday,
      'Fri': weekly.friday,
      'Sat': weekly.saturday,
      'Sun': weekly.sunday,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: days.entries.map((entry) {
        final day = entry.key;
        final slots = entry.value ?? [];

        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(day, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              if (slots.isNotEmpty)
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: slots.map((slot) => Chip(label: Text(slot))).toList(),
                )
              else
                const Text('No slots', style: TextStyle(color: Colors.grey)),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget previewExceptionSchedule(List<ExceptionSlot> exceptions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: exceptions.map((e) {
        final day = "${DateFormat.yMMMd().format(e.date!)}";
        final slots = e.timeSlots ?? [];

        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(day, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              if (slots.isNotEmpty)
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: slots.map((slot) => Chip(label: Text(slot))).toList(),
                )
              else
                const Text('No slots', style: TextStyle(color: Colors.grey)),
            ],
          ),
        );
      }).toList(),
    );
  }

}

//
//
//
// class ExceptionsEditor extends StatefulWidget {
//   final Schedule schedule;
//   const ExceptionsEditor({super.key, required this.schedule});
//
//   @override
//   State<ExceptionsEditor> createState() => _ExceptionsEditorState();
// }
//
// class _ExceptionsEditorState extends State<ExceptionsEditor> {
//   final Map<DateTime, List<String>> _exceptionMap = {};
//   DateTime? _selectedDate;
//   TimeOfDay? _startTime;
//   TimeOfDay? _endTime;
//
//   @override
//   void initState() {
//     super.initState();
//     for (final ex in widget.schedule.exceptions ?? []) {
//       _exceptionMap[ex.date!] = [...ex.timeSlots ?? []];
//     }
//   }
//
//   Future<void> _pickDate() async {
//     final picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime.now().add(const Duration(days: 365)),
//     );
//     if (picked != null) {
//       setState(() => _selectedDate = picked);
//     }
//   }
//
//   Future<void> _pickTime(bool isStart) async {
//     final picked = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
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
//   void _addExceptionSlot() {
//     if (_selectedDate != null && _startTime != null && _endTime != null) {
//       final slot = '${_startTime!.format(context)} - ${_endTime!.format(context)}';
//       setState(() {
//         _exceptionMap.putIfAbsent(_selectedDate!, () => []).add(slot);
//         _startTime = null;
//         _endTime = null;
//       });
//     }
//   }
//
//   void _save() {
//     // final updated = _exceptionMap.entries
//     //     .map((e) => ExceptionDay(date: e.key, timeSlots: e.value))
//     //     .toList();
//     // Navigator.pop(context, updated);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Edit Exceptions")),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           TextButton(
//             onPressed: _pickDate,
//             child: Text(_selectedDate == null
//                 ? "Select Date"
//                 : DateFormat.yMMMd().format(_selectedDate!)),
//           ),
//           if (_selectedDate != null) ...[
//             Wrap(
//               spacing: 8,
//               children: _exceptionMap[_selectedDate!]
//                   ?.map((slot) => Chip(label: Text(slot)))
//                   .toList() ??
//                   [],
//             ),
//             Row(
//               children: [
//                 TextButton(
//                   onPressed: () => _pickTime(true),
//                   child: Text(_startTime == null ? "Start Time" : _startTime!.format(context)),
//                 ),
//                 Text(" - "),
//                 TextButton(
//                   onPressed: () => _pickTime(false),
//                   child: Text(_endTime == null ? "End Time" : _endTime!.format(context)),
//                 ),
//                 Spacer(),
//                 IconButton(
//                   onPressed: _addExceptionSlot,
//                   icon: const Icon(Icons.add),
//                 ),
//               ],
//             ),
//           ],
//           ElevatedButton.icon(
//             onPressed: _save,
//             icon: const Icon(Icons.save),
//             label: const Text("Save Exceptions"),
//           ),
//         ],
//       ),
//     );
//   }
// }

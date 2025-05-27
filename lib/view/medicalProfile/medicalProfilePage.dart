import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:telemedicine/controller/doctorController.dart';
import 'package:telemedicine/controller/scheduleController.dart';
import 'package:telemedicine/model/MedicalProfile.dart';
import 'package:telemedicine/view/modals/addWeeklyScheduleModal.dart';

import '../../constants/constants.dart';
import '../../model/Schedule.dart';
import '../../service/shared_preference.dart';
import '../../utils/utils.dart';
import '../../widgets/headerMiniCardWidget.dart';
import '../modals/addExceptionScheduleModal.dart';

class MedicalProfilePage extends StatefulWidget {
  const MedicalProfilePage({super.key});

  @override
  State<MedicalProfilePage> createState() => _MedicalProfilePageState();
}

class _MedicalProfilePageState extends State<MedicalProfilePage> {
  MedicalProfile? medicalProfile;
  final _expController = TextEditingController();
  final _specialityController = TextEditingController();
  final _hospitalController = TextEditingController();

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadMedicalProfile();
  }

  Future<void> _loadMedicalProfile() async {
    try {
      medicalProfile = await DoctorController.getMedicalProfile();
    } catch (e) {
      medicalProfile = MedicalProfile();
    }

    _expController.text = medicalProfile?.yearsOfExperience?.toString() ?? '';
    _specialityController.text = medicalProfile?.specialty?.toString() ?? '';
    _hospitalController.text = medicalProfile?.currentHospital?.toString() ?? '';

    setState(() => isLoading = false);
  }

  Future<void> _saveSetup() async {
    var yearsOfExperience = int.tryParse(_expController.text);
    var specialty = _specialityController.text;
    var currentHospital = _hospitalController.text;
    var userId = await SharedPreference.getString(Constants.userId);

    if (yearsOfExperience != null && specialty != null) {

      MedicalProfile newMedProfile = MedicalProfile(id: medicalProfile!.id,yearsOfExperience: yearsOfExperience,specialty: specialty,currentHospital: currentHospital,doctorId: userId);
      await DoctorController.updateMedicalProfile(newMedProfile);
      _loadMedicalProfile();
    }else{
      Utils.showSnackBar(context,"Years of Experience and Speciality can not be empty !",type: "error");
    }
  }


  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }


    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderMiniCardWidget(title: "Medical Profile"),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _buildSectionTitle("Update Medical Profile"),
                const SizedBox(height: 16),
                _buildInputField("Years Of Experience", _expController,TextInputType.number),
                const SizedBox(height: 16),
                _buildInputField("Specialty", _specialityController,TextInputType.name),
                const SizedBox(height: 16),
                _buildInputField("Current Hospital", _hospitalController,TextInputType.name),

                const SizedBox(height: 50),
                // Spacer(),
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

        ],
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller,keyboardType) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      keyboardType: keyboardType,
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(title, style: Theme.of(context).textTheme.titleMedium),
    );
  }


}

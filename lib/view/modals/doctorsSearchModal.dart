import 'package:flutter/material.dart';
import 'package:telemedicine/view/doctors/doctorSearchItem.dart';

import '../../constants/colors.dart';
import '../../controller/doctorController.dart';
import '../../dto/Doctor.dart';
import '../../utils/utils.dart';
import '../../widgets/custom/chiipppp.dart';
import '../../widgets/custom/custombtn.dart';
import '../../widgets/custom/detailstext1.dart';
import '../../widgets/custom/detailstext2.dart';
import '../../widgets/custom/text11.dart';
import '../../widgets/headerMiniCardWidget.dart';
import '../../widgets/ratingStarsWidget.dart';


class DoctorSearchModal extends StatefulWidget {
  const DoctorSearchModal({super.key});

  @override
  State<DoctorSearchModal> createState() => _DoctorSearchModalState();
}

class _DoctorSearchModalState extends State<DoctorSearchModal> {
  List<Doctor> doctors = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchDoctors();
  }

  Future<void> fetchDoctors() async {
    setState(() => isLoading = true);

    try {
      // Replace with your API call or service method
      final response = await DoctorController.fetchAllAvailableDoctors(); // List<User>

      setState(() {
        doctors = response;
      });
    } catch (e) {
      Utils.showSnackBar(context, "failed to load Doctors",type: "error");
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderMiniCardWidget(title: "Doctors Search"),
            const SizedBox(height: 8.0),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Chipppp(text: 'All'),
                    SizedBox(width: 10,),
                    Chipppp(text: 'Dentist',color: AppColors.buttonColor,),
                    SizedBox(width: 10,),
                    Chipppp(text: 'Cardiologist'),
                    SizedBox(width: 10,),
                    Chipppp(text: 'Nurologist'),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),

            if (isLoading)
              const Center(child: CircularProgressIndicator())
            else if (doctors.isEmpty)
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: Text('No doctors available')),
                ),
              )
            else
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  return DoctorSearchItem(doctor: doctors[index]);
                },
              ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

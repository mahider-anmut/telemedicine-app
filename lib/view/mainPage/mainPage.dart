import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:telemedicine/constants/assets.dart';
import 'package:telemedicine/view/hospitals/hospitals.dart';
import 'package:telemedicine/view/prescribtions/prescribtionHomePage.dart';
import '../../constants/constants.dart';
import '../../constants/textStyles.dart';
// import '../../service/permission_service.dart';
import '../../widgets/headerCardWidget.dart';
import '../../widgets/infoCardWidget.dart';
import '../appointments/appointmentHomePage.dart';
import '../checkup/checkupHomePage.dart';
import '../doctors/doctorsHomePage.dart';
import '../pharmacy/Pharmacy.dart';
import '../report/reportHomePage.dart';


class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeaderCardWidget(),
          SizedBox(height: 20.0),
          Text(
            "How can we help?",
            textAlign: TextAlign.center,
            style: AppTextStyles.titleStyle(context),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Pharmacy()),
                    );
                  },
                  child: InfoCardWidget(
                    isDarkMode: false,
                    icon: LocalAssets.pharmacyIcon,
                    title: "Pharmacy",
                    description: "Find the nearest Pharmacy to you.",
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Hospitals()),
                    );
                  },
                  child: InfoCardWidget(
                    isDarkMode: false,
                    icon: LocalAssets.hospitalIcon,
                    title: "Hospitals",
                    description: "Find the nearest Hospitals to visit",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DoctorsHomePage()),
                    );
                  },
                  child: InfoCardWidget(
                    isDarkMode: false,
                    icon: LocalAssets.doctorIcon,
                    title: "Doctors",
                    description: "Find and consult Doctors",
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AppointmentHomePage()),
                    );
                  },
                  child: InfoCardWidget(
                    isDarkMode: false,
                    icon: LocalAssets.appointmentIcon,
                    title: "Appointments",
                    description: "Manage your appointments.",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PrescriptionHomePage()),
                    );
                  },
                  child: InfoCardWidget(
                    isDarkMode: false,
                    icon: LocalAssets.prescriptionIcon,
                    title: "Prescriptions",
                    description: "Get your Prescriptions",
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CheckupHomePage()),
                    );
                  },
                  child: InfoCardWidget(
                    isDarkMode: false,
                    icon: LocalAssets.checkupIcon,
                    title: "Checkups",
                    description: "Follow your checkups easily.",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ReportHomePage()),
                    );
                  },
                  child: InfoCardWidget(
                    isDarkMode: false,
                    icon: LocalAssets.reportIcon,
                    title: "Reports",
                    description: "Get your reports easily.",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}

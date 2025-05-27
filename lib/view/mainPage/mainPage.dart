import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:telemedicine/constants/assets.dart';
import 'package:telemedicine/view/ProfilePage.dart';
import 'package:telemedicine/view/consultations/consultationHomePage.dart';
import 'package:telemedicine/view/hospitals/hospitalsHomePage.dart';
import 'package:telemedicine/view/medicalProfile/medicalProfilePage.dart';
import 'package:telemedicine/view/notificationPage.dart';
import 'package:telemedicine/view/prescribtions/prescribtionHomePage.dart';
import '../../constants/constants.dart';
import '../../constants/textStyles.dart';
// import '../../service/permission_service.dart';
import '../../service/localization.dart';
import '../../service/permission_service.dart';
import '../../service/shared_preference.dart';
import '../../utils/utils.dart';
import '../../widgets/headerCardWidget.dart';
import '../../widgets/infoCardWidget.dart';
import '../appointments/appointmentHomePage.dart';
import '../checkup/checkupHomePage.dart';
import '../doctorSchedule/doctorSchedulePage.dart';
import '../doctors/doctorsHomePage.dart';
import '../modals/ambulanceModal.dart';
import '../pharmacy/pharmacyHomePage.dart';
import '../report/reportHomePage.dart';


class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  String role = "";

  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
      var userRole = await SharedPreference.getString(Constants.role);
      setState(() {
        role = userRole;
      });
  }

  @override
  Widget build(BuildContext context) {


    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeaderCardWidget(),
          SizedBox(height: 30.0),
          Text(
            "How can we help?",
            textAlign: TextAlign.center,
            style: AppTextStyles.titleStyle(context),
          ),
          SizedBox(height: 30.0),
          Visibility(
            visible: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PharmacyHomePage()),
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
                        MaterialPageRoute(builder: (context) => const HospitalsHomePage()),
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
          ),
          Visibility(
            visible: role=="doctor",
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MedicalProfilePage()),
                      );
                    },
                    child: InfoCardWidget(
                      isDarkMode: false,
                      icon: LocalAssets.reportIcon,
                      title: "Medical Profile",
                      description: "Get your Medical profile.",
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DoctorSchedulePage()),
                      );
                    },
                    child: InfoCardWidget(
                      isDarkMode: false,
                      icon: LocalAssets.scheduleIcon,
                      title: "Schedule Manager",
                      description: "Setup your availability easily.",
                    ),
                  ),
                ],
              ),
            ),
          ),


          SizedBox(height: 20.0),
          Visibility(
            visible: role=="patient",
            child: Padding(
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
          ),
          Visibility(
            visible: role=="doctor",
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ConsultationHomePage()),
                      );
                    },
                    child: InfoCardWidget(
                      isDarkMode: false,
                      icon: LocalAssets.consultingAltIcon,
                      title: "Consultation",
                      description: "Chat with your patients.",
                    ),
                  ),
                ],
              ),
            ),
          ),





          // SizedBox(height: 20.0),
          Visibility(
            visible: false,
            child: Padding(
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
          ),



          Visibility(visible: role=="patient",child: SizedBox(height: 20.0)),
          Visibility(
            visible: role=="patient",
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => const ReportHomePage()),
                  //     );
                  //   },
                  //   child: InfoCardWidget(
                  //     isDarkMode: false,
                  //     icon: LocalAssets.reportIcon,
                  //     title: "Reports",
                  //     description: "Get your reports easily.",
                  //   ),
                  // ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ConsultationHomePage()),
                      );
                    },
                    child: InfoCardWidget(
                      isDarkMode: false,
                      icon: LocalAssets.consultingAltIcon,
                      title: "Consultation",
                      description: "Chat with your patients.",
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      bool hasPermission = await requestLocationPermission();
                      if (hasPermission) {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          enableDrag: false,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32.0),
                              topRight: Radius.circular(32.0),
                            ),
                          ),
                          builder: (context) => const AmbulanceModal(),
                        );
                      } else {
                        Utils.showToast(AppLocalizations.of(context).translate('locationPermissionDenied'),type: "info");
                      }
                    },
                    child: InfoCardWidget(
                      isDarkMode: false,
                      icon: LocalAssets.consultingAltIcon,
                      title: "Ambulance",
                      description: "Request for Ambulance",
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => const DoctorSchedulePage()),
                  //     );
                  //   },
                  //   child: InfoCardWidget(
                  //     isDarkMode: false,
                  //     icon: LocalAssets.scheduleIcon,
                  //     title: "Schedule Manager",
                  //     description: "Setup your availability easily.",
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Visibility(
            //visible: role=="doctor",
            visible: true,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NotificationPage()),
                      );
                    },
                    child: InfoCardWidget(
                      isDarkMode: false,
                      icon: LocalAssets.notificationAltIcon,
                      title: "Notification",
                      description: "Get your reports easily.",
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProfilePage()),
                      );
                    },
                    child: InfoCardWidget(
                      isDarkMode: false,
                      icon: LocalAssets.userIcon,
                      title: "Profile",
                      description: "Check your account profile.",
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}



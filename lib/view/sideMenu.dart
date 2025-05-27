import 'package:flutter/material.dart';
import 'package:telemedicine/model/MedicalProfile.dart';
import 'package:telemedicine/view/ProfilePage.dart';
import 'package:telemedicine/view/appointments/appointmentHomePage.dart';
import 'package:telemedicine/view/checkup/checkupHomePage.dart';
import 'package:telemedicine/view/consultations/consultationHomePage.dart';
import 'package:telemedicine/view/doctorSchedule/doctorSchedulePage.dart';
import 'package:telemedicine/view/doctors/doctorsHomePage.dart';
import 'package:telemedicine/view/favorites/favoritesHomePage.dart';
import 'package:telemedicine/view/hospitals/hospitalsHomePage.dart';
import 'package:telemedicine/view/medicalProfile/medicalProfilePage.dart';
import 'package:telemedicine/view/notificationPage.dart';
import 'package:telemedicine/view/prescribtions/prescribtionHomePage.dart';


import '../constants/assets.dart';
import '../constants/constants.dart';
import '../constants/textStyles.dart';
import '../service/localization.dart';
import '../service/shared_preference.dart';
import '../utils/themes.dart';
import '../utils/utils.dart';
import 'auth/loginPage.dart';
import 'homePage.dart';
import 'pharmacy/pharmacyHomePage.dart';
import 'report/reportHomePage.dart';


class SideMenu extends StatefulWidget {
  const SideMenu({super.key});


  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  String firstName = "";
  String lastName = "";
  String role ="";

  @override
  void initState() {
    super.initState();

    checkFirst();
  }

  checkFirst() async {
    String first = await SharedPreference.getString(Constants.firstName);
    String last = await SharedPreference.getString(Constants.lastName);
    String usrRole = await SharedPreference.getString(Constants.role);

    setState((){
      firstName = first;
      lastName = last;
      role = usrRole;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.getThemeExtension(context).primaryBGColor!,
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("${Utils.capitalize(firstName)} ${Utils.capitalize(lastName)}",style:AppTextStyles.sideMenuNameStyle(context)),
            ),
            decoration: BoxDecoration(
              // color: AppTheme.getThemeExtension(context).primaryColor!,
              image: DecorationImage(
                image: AssetImage(LocalAssets.bgHeaderImage), // Change path to your image
                fit: BoxFit.cover,
                alignment: Alignment(0.6,-0.5),
              ),
            ),
            accountEmail: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(Utils.capitalize(role),style:AppTextStyles.sideMenuBodySmallStyle(context)),
            ),
            currentAccountPicture: const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(LocalAssets.avatar),
              ),
            ),
          ),
          Visibility(
            visible: false,
            child: SizedBox(
              height: 45,
              child: ListTile(
                title:  Text(AppLocalizations.of(context).translate('Favourites'),style:AppTextStyles.sideMenuTitleStyle(context)),
                leading:  const Image(image: AssetImage(LocalAssets.favouritesIcon),width: 22, height: 22,),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FavoritesHomePage()),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 45,
            child: ListTile(
              title:  Text(AppLocalizations.of(context).translate('Notifications'),style:AppTextStyles.sideMenuTitleStyle(context)),
              leading:  const Image(image: AssetImage(LocalAssets.notificationIcon),width: 22, height: 22,),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationPage()),
                );
              },
            ),
          ),
          SizedBox(
            height: 45,
            child: ListTile(
              title:  Text(AppLocalizations.of(context).translate('Profile'),style:AppTextStyles.sideMenuTitleStyle(context)),
              leading:  const Image(image: AssetImage(LocalAssets.userIcon),width: 22, height: 22,),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
          ),
          const Divider(),
          Visibility(
            visible: false,
            child: SizedBox(
              height: 45,
              child: ListTile(
                title:  Text(AppLocalizations.of(context).translate('Hospitals'),style:AppTextStyles.sideMenuTitleStyle(context)),
                leading:  const Image(image: AssetImage(LocalAssets.hospitalIcon),width: 22, height: 22,),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HospitalsHomePage()),
                  );
                },
              ),
            ),
          ),
          Visibility(
            visible: false,
            child: SizedBox(
              height: 45,
              child: ListTile(
                title:  Text(AppLocalizations.of(context).translate('Pharmacy'),style:AppTextStyles.sideMenuTitleStyle(context)),
                leading:  const Image(image: AssetImage(LocalAssets.pharmacyIcon),width: 22, height: 22,),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PharmacyHomePage()),
                  );
                },
              ),
            ),
          ),
          Visibility(
            visible: role=="patient",
            child: SizedBox(
              height: 45,
              child: ListTile(
                title:  Text(AppLocalizations.of(context).translate('Doctors'),style:AppTextStyles.sideMenuTitleStyle(context)),
                leading:  const Image(image: AssetImage(LocalAssets.doctorIcon),width: 22, height: 22,),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DoctorsHomePage()),
                  );
                },
              ),
            ),
          ),
          Visibility(
            visible: role=="doctor",
            child: SizedBox(
              height: 45,
              child: ListTile(
                title:  Text(AppLocalizations.of(context).translate('MedicalProfile'),style:AppTextStyles.sideMenuTitleStyle(context)),
                leading:  const Image(image: AssetImage(LocalAssets.doctorIcon),width: 22, height: 22,),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MedicalProfilePage()),
                  );
                },
              ),
            ),
          ),
          Visibility(
            visible: role=="doctor",
            child: SizedBox(
              height: 45,
              child: ListTile(
                title:  Text(AppLocalizations.of(context).translate('ScheduleManager'),style:AppTextStyles.sideMenuTitleStyle(context)),
                leading:  const Image(image: AssetImage(LocalAssets.doctorIcon),width: 22, height: 22,),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DoctorSchedulePage()),
                  );
                },
              ),
            ),
          ),


          const Divider(),
          Visibility(
            visible: true,
            child: SizedBox(
              height: 45,
              child: ListTile(
                title:  Text(AppLocalizations.of(context).translate('Appointments'),style:AppTextStyles.sideMenuTitleStyle(context)),
                leading:  const Image(image: AssetImage(LocalAssets.appointmentIcon),width: 22, height: 22,),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AppointmentHomePage()),
                  );
                },
              ),
            ),
          ),
          Visibility(
            visible: true,
            child: SizedBox(
              height: 45,
              child: ListTile(
                title:  Text(AppLocalizations.of(context).translate('Consultation'),style:AppTextStyles.sideMenuTitleStyle(context)),
                leading:  const Image(image: AssetImage(LocalAssets.consultingIcon),width: 22, height: 22,),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ConsultationHomePage()),
                  );
                },
              ),
            ),
          ),

          Visibility(
            visible: false,
            child: SizedBox(
              height: 45,
              child: ListTile(
                title:  Text(AppLocalizations.of(context).translate('Reports'),style:AppTextStyles.sideMenuTitleStyle(context)),
                leading:  const Image(image: AssetImage(LocalAssets.reportIcon),width: 22, height: 22,),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReportHomePage()),
                  );
                },
              ),
            ),
          ),
          Visibility(
            visible: false,
            child: SizedBox(
              height: 45,
              child: ListTile(
                title:  Text(AppLocalizations.of(context).translate('Prescriptions'),style:AppTextStyles.sideMenuTitleStyle(context)),
                leading:  const Image(image: AssetImage(LocalAssets.prescriptionIcon),width: 22, height: 22,),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PrescriptionHomePage()),
                  );
                },
              ),
            ),
          ),
          Visibility(
            visible: false,
            child: SizedBox(
              height: 45,
              child: ListTile(
                title:  Text(AppLocalizations.of(context).translate('Checkups'),style:AppTextStyles.sideMenuTitleStyle(context)),
                leading:  const Image(image: AssetImage(LocalAssets.checkupIcon),width: 22, height: 22,),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckupHomePage()),
                  );
                },
              ),
            ),
          ),
          const Spacer(),
          ListTile(
            title:  Text(AppLocalizations.of(context).translate('Logout'),style:AppTextStyles.sideMenuTitleStyle(context)),
            leading:  const Image(image: AssetImage(LocalAssets.logoutIcon),width: 22, height: 22,),
            onTap: () {
              Utils.showConfirmationDialog(context, AppLocalizations.of(context).translate("Logout"), AppLocalizations.of(context).translate("LogoutConfirmationMessage"),confirmLabel: AppLocalizations.of(context).translate("Logout"), (){
                Navigator.of(context).pop();
                SharedPreference.setBool(Constants.isLoggedIn,false);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              });
            },
          ),
          const SizedBox(height: 30.0),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';


import '../constants/assets.dart';
import '../constants/constants.dart';
import '../constants/textStyles.dart';
import '../service/localization.dart';
import '../service/shared_preference.dart';
import '../utils/themes.dart';
import '../utils/utils.dart';
import 'auth/loginPage.dart';
import 'homePage.dart';
import 'patient/patientPage.dart';


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
    String role = await SharedPreference.getString(Constants.role);
    setState((){
      firstName = first;
      lastName = last;
      this.role = role;
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
              child: Text("$firstName $lastName",style:AppTextStyles.sideMenuNameStyle(context)),
            ),
            decoration: BoxDecoration(
              color: AppTheme.getThemeExtension(context).primaryColor!,
            ),
            accountEmail: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(role,style:AppTextStyles.bodySmallStyle(context)),
            ),
            currentAccountPicture: const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(LocalAssets.avatar),
              ),
            ),
          ),
          SizedBox(
            height: 45,
            child: ListTile(
              title:  Text(AppLocalizations.of(context).translate('Hospitals'),style:AppTextStyles.sideMenuTitleStyle(context)),
              leading:  const Image(image: AssetImage(LocalAssets.hospitalIcon),width: 22, height: 22,),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ),
          SizedBox(
            height: 45,
            child: ListTile(
              title:  Text(AppLocalizations.of(context).translate('Pharmacy'),style:AppTextStyles.sideMenuTitleStyle(context)),
              leading:  const Image(image: AssetImage(LocalAssets.pharmacyIcon),width: 22, height: 22,),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ),
          SizedBox(
            height: 45,
            child: ListTile(
              title:  Text(AppLocalizations.of(context).translate('Doctors'),style:AppTextStyles.sideMenuTitleStyle(context)),
              leading:  const Image(image: AssetImage(LocalAssets.doctorIcon),width: 22, height: 22,),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ),


          const Divider(),
          SizedBox(
            height: 45,
            child: ListTile(
              title:  Text(AppLocalizations.of(context).translate('Reports'),style:AppTextStyles.sideMenuTitleStyle(context)),
              leading:  const Image(image: AssetImage(LocalAssets.reportIcon),width: 22, height: 22,),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ),
          SizedBox(
            height: 45,
            child: ListTile(
              title:  Text(AppLocalizations.of(context).translate('Prescriptions'),style:AppTextStyles.sideMenuTitleStyle(context)),
              leading:  const Image(image: AssetImage(LocalAssets.prescriptionIcon),width: 22, height: 22,),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ),
          SizedBox(
            height: 45,
            child: ListTile(
              title:  Text(AppLocalizations.of(context).translate('Checkups'),style:AppTextStyles.sideMenuTitleStyle(context)),
              leading:  const Image(image: AssetImage(LocalAssets.checkupIcon),width: 22, height: 22,),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
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

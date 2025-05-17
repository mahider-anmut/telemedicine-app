// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../constants/assets.dart';
// import '../constants/textStyles.dart';
// import '../providers/localeProvider.dart';
// import '../providers/themeProvider.dart';
// import '../service/localization.dart';
// import '../service/shared_preference.dart';
// import '../constants/constants.dart';
// import '../utils/themes.dart';
// import 'notificationPage.dart';
//
// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});
//
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   bool isDarkTheme = false;
//   String firstName = "";
//   String lastName = "";
//   String companyName = "";
//   String _selectedLanguage = 'en';
//
//   @override
//   void initState() {
//     super.initState();
//     checkFirst();
//   }
//
//   checkFirst() async {
//     String first = await SharedPreference.getString(Constants.firstName);
//     String last = await SharedPreference.getString(Constants.lastName);
//     String local = await SharedPreference.getString(Constants.appLang,"en");
//     setState(() {
//       firstName = first;
//       lastName = last;
//       _selectedLanguage = local;
//     });
//   }
//
//   void toggleTheme(bool value) {
//     setState(() {
//       isDarkTheme = value;
//       // Add your theme switching logic here
//     });
//   }
//
//   void _showLanguageDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(AppLocalizations.of(context).translate('Language')),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               RadioListTile<String>(
//                 title: Text("English"),
//                 value: 'en',
//                 groupValue: _selectedLanguage,
//                 onChanged: (String? value) {
//                   setState(() {
//                     _selectedLanguage = value!;
//                   });
//                   Provider.of<LocaleProvider>(context, listen: false).setLocale(const Locale('en'));
//                   Navigator.of(context).pop();
//                 },
//               ),
//               RadioListTile<String>(
//                 title: Text("Amharic"),
//                 value: 'am',
//                 groupValue: _selectedLanguage,
//                 onChanged: (String? value) {
//                   setState(() {
//                     _selectedLanguage = value!;
//                   });
//                   Provider.of<LocaleProvider>(context, listen: false).setLocale(const Locale('am'));
//                   Navigator.of(context).pop();
//                 },
//               ),
//               // Add more languages here
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     final localeProvider = Provider.of<LocaleProvider>(context);
//
//     return Scaffold(
//       backgroundColor: AppTheme.getThemeExtension(context).primaryBGColor!,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Colors.orangeAccent,
//                     AppTheme.getThemeExtension(context).primaryColor!,
//                   ],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//               width: double.infinity,
//               child: Column(
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             IconButton(
//                               icon: Icon(
//                                 Icons.menu,
//                                 color: AppTheme.getThemeExtension(context).mainIconColor!,
//                                 size: 28,
//                               ),
//                               onPressed: () {
//                                 Scaffold.of(context).openDrawer();
//                               },
//                             ),
//                             IconButton(
//                               icon: Icon(
//                                 Icons.notifications_none,
//                                 color: AppTheme.getThemeExtension(context).mainIconColor!,
//                                 size: 28,
//                               ),
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(builder: (context) => const NotificationPage()),
//                                 );
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 12.0),
//                   const CircleAvatar(
//                     radius: 50.0,
//                     backgroundImage: NetworkImage(LocalAssets.placeholder),
//                   ),
//                   const SizedBox(height: 20.0),
//                   Text(
//                     "$firstName $lastName",
//                     style: AppTextStyles.titleStyle.copyWith(
//                       color: AppTheme.getThemeExtension(context).titleTextColor!,
//                     ),
//                   ),
//                   const SizedBox(height: 10.0),
//                   Text(
//                     companyName,
//                     style: AppTextStyles.bodySmallStyle(context).copyWith(
//                       color: AppTheme.getThemeExtension(context).titleTextColor!,
//                     ),
//                   ),
//                   const SizedBox(height: 50.0),
//                 ],
//               ),
//             ),
//             Container(
//               color: AppTheme.getThemeExtension(context).primaryBGColor!,
//               child: Column(
//                 children: [
//                   ListTile(
//                     leading: Icon(
//                       Icons.brightness_6,
//                       color: AppTheme.getThemeExtension(context).titleTextColor!,
//                     ),
//                     title: Text(
//                       AppLocalizations.of(context).translate('DarkMode'),
//                       style: TextStyle(color: AppTheme.getThemeExtension(context).titleTextColor!),
//                     ),
//                     trailing: Switch(
//                       value: themeProvider.isDarkMode,
//                       activeColor: AppTheme.getThemeExtension(context).primaryColor!,
//                       onChanged: (value) {
//                         themeProvider.toggleTheme();
//                       },
//                     ),
//                   ),
//                   const Divider(),
//                   ListTile(
//                     leading: Icon(
//                       Icons.translate,
//                       color: AppTheme.getThemeExtension(context).titleTextColor!,
//                     ),
//                     title: Text(
//                       AppLocalizations.of(context).translate('Language'),
//                       style: TextStyle(color: AppTheme.getThemeExtension(context).titleTextColor!),
//                     ),
//                     trailing: Text(
//                       _selectedLanguage == 'en' ? 'English' : 'Amharic',
//                       style: TextStyle(color: AppTheme.getThemeExtension(context).titleTextColor!),
//                     ),
//                     onTap: _showLanguageDialog,
//                   ),
//                   const Divider(),
//                   ListTile(
//                     leading: Icon(
//                       Icons.description,
//                       color: AppTheme.getThemeExtension(context).titleTextColor!,
//                     ),
//                     title: Text(
//                       AppLocalizations.of(context).translate('Account'),
//                       style: TextStyle(color: AppTheme.getThemeExtension(context).titleTextColor!),
//                     ),
//                     onTap: () {
//                       // Add your account logic here
//                     },
//                   ),
//                   const Divider(),
//                   ListTile(
//                     leading: Icon(
//                       Icons.description,
//                       color: AppTheme.getThemeExtension(context).titleTextColor!,
//                     ),
//                     title: Text(
//                       AppLocalizations.of(context).translate('TermsAndConditions'),
//                       style: TextStyle(color: AppTheme.getThemeExtension(context).titleTextColor!),
//                     ),
//                     onTap: () {
//                       // Add your terms and conditions logic here
//                     },
//                   ),
//                   const Divider(),
//                   ListTile(
//                     leading: Icon(
//                       Icons.description,
//                       color: AppTheme.getThemeExtension(context).titleTextColor!,
//                     ),
//                     title: Text(
//                       AppLocalizations.of(context).translate('HelpAndFAQs'),
//                       style: TextStyle(color: AppTheme.getThemeExtension(context).titleTextColor!),
//                     ),
//                     onTap: () {
//                       // Add your help and FAQs logic here
//                     },
//                   ),
//                   const Divider(),
//                   ListTile(
//                     leading: Icon(
//                       Icons.description,
//                       color: AppTheme.getThemeExtension(context).titleTextColor!,
//                     ),
//                     title: Text(
//                       AppLocalizations.of(context).translate('About'),
//                       style: TextStyle(color: AppTheme.getThemeExtension(context).titleTextColor!),
//                     ),
//                     onTap: () {
//                       // Add your about logic here
//                     },
//                   ),
//                   const Divider(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:telemedicine/constants/assets.dart';

import '../constants/colors.dart';
import '../constants/constants.dart';
import '../providers/localeProvider.dart';
import '../providers/themeProvider.dart';
import '../service/localization.dart';
import '../service/shared_preference.dart';
import '../utils/themes.dart';
import '../widgets/headerCardWidget.dart';
import 'notificationPage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  bool isDarkTheme = false;
  String firstName = "";
  String lastName = "";
  String companyName = "";
  String _selectedLanguage = 'en';

  @override
  void initState() {
    super.initState();
    checkFirst();
  }

  checkFirst() async {
    String first = await SharedPreference.getString(Constants.firstName);
    String last = await SharedPreference.getString(Constants.lastName);
    String local = await SharedPreference.getString(Constants.appLang,"en");
    setState(() {
      firstName = first;
      lastName = last;
      _selectedLanguage = local;
    });
  }

  void toggleTheme(bool value) {
    setState(() {
      isDarkTheme = value;
      // Add your theme switching logic here
    });
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context).translate('Language')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<String>(
                title: Text("English"),
                value: 'en',
                groupValue: _selectedLanguage,
                onChanged: (String? value) {
                  setState(() {
                    _selectedLanguage = value!;
                  });
                  Provider.of<LocaleProvider>(context, listen: false).setLocale(const Locale('en'));
                  Navigator.of(context).pop();
                },
              ),
              RadioListTile<String>(
                title: Text("Amharic"),
                value: 'am',
                groupValue: _selectedLanguage,
                onChanged: (String? value) {
                  setState(() {
                    _selectedLanguage = value!;
                  });
                  Provider.of<LocaleProvider>(context, listen: false).setLocale(const Locale('am'));
                  Navigator.of(context).pop();
                },
              ),
              // Add more languages here
            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);

    return Scaffold(
      backgroundColor: AppTheme.getThemeExtension(context).primaryBGColor!,
      // appBar: AppBar(
      //   backgroundColor: AppTheme.getThemeExtension(context).primaryBGColor!,
      //   //title: const Text("Profile"),
      // ),
      body: SingleChildScrollView(
        //padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.30,
            decoration: BoxDecoration(

              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
              image: DecorationImage(
                image: AssetImage(LocalAssets.bgHeaderImageClean), // Change path to your image
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(Icons.menu,color: AppColors.mainIconColor,),
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                            ),

                            IconButton(
                              icon: Icon(Icons.notifications,color: AppColors.mainIconColor!,),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => NotificationPage()),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ProfilePic(),
                          ],
                        ),

                      ),

                    ]
                ),

                SizedBox(height: 20),

              ],
            ),


          ),
            // const ProfilePic(),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: LocalAssets.userIcon,
              press: () => {},
            ),
            ProfileMenu(
              text: "Notifications",
              icon: LocalAssets.notificationIcon,
              press: () {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: LocalAssets.settingsIcon,
              press: _showLanguageDialog,
            ),
            ProfileMenu(
              text: "Help Center",
              icon: LocalAssets.helpIcon,
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: LocalAssets.logoutIcon,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePic extends StatefulWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          const CircleAvatar(
            backgroundImage:
            AssetImage(LocalAssets.avatar),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.white),
                  ),
                  backgroundColor: const Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: SvgPicture.string(LocalAssets.cameraIcon),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: AppTheme.getThemeExtension(context).primaryColor!,
          padding: const EdgeInsets.all(20),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: const Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            // SvgPicture.asset(
            //   icon,
            //   colorFilter:
            //   ColorFilter.mode(AppTheme.getThemeExtension(context).primaryColor!, BlendMode.srcIn),
            //   width: 22,
            // ),
            Image(
              image: AssetImage(icon),
              width: 22, // Optional: adjust size
              height: 22,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: Color(0xFF757575),
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF757575),
            ),
          ],
        ),
      ),
    );
  }
}



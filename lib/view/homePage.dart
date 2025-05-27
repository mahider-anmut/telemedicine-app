import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:telemedicine/constants/assets.dart';
import 'package:telemedicine/service/permission_service.dart';
import 'package:telemedicine/view/appointments/appointmentHomePage.dart';
import 'package:telemedicine/view/consultations/consultationHomePage.dart';
import 'package:telemedicine/view/mainPage/mainPage.dart';

import '../constants/constants.dart';
import '../service/localization.dart';
import '../service/shared_preference.dart';
import '../utils/themes.dart';
import '../utils/utils.dart';
import 'ProfilePage.dart';
import 'favorites/favoritesHomePage.dart';
import 'modals/ambulanceModal.dart';
import 'sideMenu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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

  String activePage = "homepage";

  Widget getPageWidget(String selectedPage) {
    switch (selectedPage) {
      case 'homepage':
        return MainPage();
      case 'profile':
        return ProfilePage();
      case 'favourites':
        return FavoritesHomePage();
      case 'consultation':
        return ConsultationHomePage();
      default:
        return MainPage();
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.getThemeExtension(context).primaryBGColor!,
        drawer: SideMenu(),
        body: getPageWidget(activePage),
        bottomNavigationBar: role=="-"?Container(
          padding: const EdgeInsets.only(bottom: 8.0),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.grey, width: 0.5),
            ),
          ),
          child: SizedBox(
            height: 50,
            child: BottomAppBar(
              color: AppTheme.getThemeExtension(context).primaryBGColor!,
              padding: EdgeInsets.zero,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 32,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              activePage = "homepage";
                            });
                          },
                          child: Image(
                            image: AssetImage(LocalAssets.homeIcon),
                            width: 22, // Optional: adjust size
                            height: 22,
                          ),
                        )
                        // child: IconButton(
                        //   icon: Icon(
                        //     Icons.home,
                        //     color: activePage == "homepage"
                        //         ? AppTheme.getThemeExtension(context).primaryColor!
                        //         : AppTheme.getThemeExtension(context).secondaryIconColor!,
                        //   ),
                        //   onPressed: () {
                        //     setState(() {
                        //       activePage = "homepage";
                        //     });
                        //   },
                        // ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            activePage = "homepage";
                          });
                        },
                        child: Text(
                          AppLocalizations.of(context).translate('Home'),
                          style: TextStyle(
                            fontSize: 12.0,
                            color: activePage == "homepage"
                                ? AppTheme.getThemeExtension(context).primaryColor!
                                : AppTheme.getThemeExtension(context).secondaryIconColor!,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 32,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              activePage = "favourites";
                            });
                          },
                          child: Image(
                            image: AssetImage(LocalAssets.favouritesAltIcon),
                            width: 22, // Optional: adjust size
                            height: 22,
                          ),
                        )
                        // child: IconButton(
                        //   icon: Icon(
                        //     Icons.schedule,
                        //     color: activePage == "Appointments"
                        //         ? AppTheme.getThemeExtension(context).primaryColor!
                        //         : AppTheme.getThemeExtension(context).secondaryIconColor!,
                        //   ),
                        //   onPressed: () {
                        //     setState(() {
                        //       activePage = "Appointments";
                        //     });
                        //   },
                        // ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            activePage = "favourites";
                          });
                        },
                        child: Text(
                          AppLocalizations.of(context).translate('Favourites'),
                          style: TextStyle(
                            fontSize: 12.0,
                            color: activePage == "favourites"
                                ? AppTheme.getThemeExtension(context).primaryColor!
                                : AppTheme.getThemeExtension(context).secondaryIconColor!,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 40.0),
                  Column(
                    children: [
                      SizedBox(
                        height: 32,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              activePage = "consultation";
                            });
                          },
                          child: Image(
                            image: AssetImage(LocalAssets.consultingIcon),
                            width: 22, // Optional: adjust size
                            height: 22,
                          ),
                        ),
                        // child: IconButton(
                        //   icon: Icon(
                        //     Icons.message_outlined,
                        //     color: activePage == "Consultation"
                        //         ? AppTheme.getThemeExtension(context).primaryColor!
                        //         : AppTheme.getThemeExtension(context).secondaryIconColor!,
                        //   ),
                        //   onPressed: () {
                        //     setState(() {
                        //       activePage = "Consultation";
                        //     });
                        //   },
                        // ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            activePage = "consultation";
                          });
                        },
                        child: Text(
                          AppLocalizations.of(context).translate('Consultation'),
                          style: TextStyle(
                            fontSize: 12.0,
                            color: activePage == "consultation"
                                ? AppTheme.getThemeExtension(context).primaryColor!
                                : AppTheme.getThemeExtension(context).secondaryIconColor!,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 32,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              activePage = "profile";
                            });
                          },
                          child: Image(
                            image: AssetImage(LocalAssets.profileIcon),
                            width: 22, // Optional: adjust size
                            height: 22,
                          ),
                        ),
                        // child: IconButton(
                        //   icon: Icon(
                        //     Icons.person,
                        //     color: activePage == "profile"
                        //         ? AppTheme.getThemeExtension(context).primaryColor!
                        //         : AppTheme.getThemeExtension(context).secondaryIconColor!,
                        //   ),
                        //   onPressed: () {
                        //     setState(() {
                        //       activePage = "profile";
                        //     });
                        //   },
                        // ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            activePage = "profile";
                          });
                        },
                        child: Text(
                          AppLocalizations.of(context).translate('Profile'),
                          style: TextStyle(
                            fontSize: 12.0,
                            color: activePage == "profile"
                                ? AppTheme.getThemeExtension(context).primaryColor!
                                : AppTheme.getThemeExtension(context).secondaryIconColor!,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ):null,
        floatingActionButton: Visibility(
          // visible: role=="patient",
          visible: false,
          child: FloatingActionButton(
            // shape: const CircleBorder(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
              side: BorderSide(
                color: AppTheme.getThemeExtension(context).primaryBGColor!,
                width: 2,
              ),
            ),
            backgroundColor: AppTheme.getThemeExtension(context).primaryLightColor!,
            // backgroundColor: AppTheme.getThemeExtension(context).primaryColor!,
            onPressed: () async {
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
            child: Image(
              image: AssetImage(LocalAssets.ambulanceIcon),
              width: 32, // Optional: adjust size
              height: 32,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
  }
}
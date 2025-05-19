import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../service/localization.dart';
import '../../utils/themes.dart';
import '../../widgets/custom/detailstext1.dart';
import '../../widgets/headerMiniCardWidget.dart';

import 'appointmentList.dart';

class AppointmentHomePage extends StatefulWidget {
   const AppointmentHomePage({super.key});

  @override
  State<AppointmentHomePage> createState() => _AppointmentHomePageState();
}

class _AppointmentHomePageState extends State<AppointmentHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: Column(
        children: [
          HeaderMiniCardWidget(title: "Appointments",),

          TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const Icon(Icons.person),
                    // Image(
                    //   image: AssetImage(LocalAssets.userIcon),
                    //   width: 18, // Optional: adjust size
                    //   height: 18,
                    // ),
                    // const SizedBox(width: 8),
                    Text(localizations.translate("Upcoming")),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image(
                    //   image: AssetImage(LocalAssets.doctorIcon),
                    //   width: 20, // Optional: adjust size
                    //   height: 20,
                    // ),
                    // const SizedBox(width: 8),
                    Text(localizations.translate("Completed")),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image(
                    //   image: AssetImage(LocalAssets.doctorIcon),
                    //   width: 20, // Optional: adjust size
                    //   height: 20,
                    // ),
                    // const SizedBox(width: 8),
                    Text(localizations.translate("Cancelled")),
                  ],
                ),
              )
            ],
            isScrollable: false,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: AppTheme.getThemeExtension(context).primaryColor!,
            labelColor: AppTheme.getThemeExtension(context).primaryLightColor!,
            unselectedLabelColor: AppTheme.getThemeExtension(context).secondaryAltColor!,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                AppointmentList(),
                AppointmentList(),
                AppointmentList()
              ],
            ),
          ),
        ],
      ),
    );
  }
}



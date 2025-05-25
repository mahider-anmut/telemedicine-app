import 'package:flutter/material.dart';
import 'package:telemedicine/controller/appointmentController.dart';

import '../../constants/colors.dart';
import '../../model/Appointment.dart';
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

  List<Appointment> allAppointments = [];
  List<Appointment> upcomingAppointments = [];
  List<Appointment> completedAppointments = [];
  List<Appointment> cancelledAppointments = [];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() => setState(() {}));
    _fetchAppointments();
  }

  Future<void> _fetchAppointments() async {
    setState(() => isLoading = true);
    try {
      List<Appointment> appointments = await AppointmentController.getAllAppointment();

      setState(() {
        allAppointments = appointments;
        upcomingAppointments = appointments
            .where((a) => (a.appointmentStatus == "pending" || a.appointmentStatus =="accepted" || a.appointmentStatus =="waitingPayment" || a.appointmentStatus =="readyForSession") )
            .toList();
        completedAppointments = appointments
            .where((a) => a.appointmentStatus == "completed")
            .toList();
        cancelledAppointments = appointments
            .where((a) => (a.appointmentStatus == "cancelled" || a.appointmentStatus == "expired"))
            .toList();
      });
    } catch (e) {
      debugPrint("Error fetching appointments: $e");
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      body: Column(
        children: [
          const HeaderMiniCardWidget(title: "Appointments"),

          TabBar(
            controller: _tabController,
            tabs: [
              Tab(child: Text(localizations.translate("Upcoming"))),
              Tab(child: Text(localizations.translate("Completed"))),
              Tab(child: Text(localizations.translate("Cancelled"))),
            ],
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: AppTheme.getThemeExtension(context).primaryColor!,
            labelColor: AppTheme.getThemeExtension(context).primaryLightColor!,
            unselectedLabelColor:
            AppTheme.getThemeExtension(context).secondaryAltColor!,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),

          Expanded(
            child: RefreshIndicator(
              onRefresh: _fetchAppointments,
              child: TabBarView(
                controller: _tabController,
                children: [
                  AppointmentList(appointments: upcomingAppointments,fetchAppointments: _fetchAppointments),
                  AppointmentList(appointments: completedAppointments,fetchAppointments: _fetchAppointments),
                  AppointmentList(appointments: cancelledAppointments,fetchAppointments: _fetchAppointments),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

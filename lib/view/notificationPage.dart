import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/textStyles.dart';
import '../controller/notificationsController.dart';
import '../model/Notification.dart' as Notif;
import '../service/localization.dart';
import '../utils/themes.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.getThemeExtension(context).primaryBGColor!,
      appBar: AppBar(
        backgroundColor: AppTheme.getThemeExtension(context).primaryBGColor!,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppTheme.getThemeExtension(context).secondaryIconColor!,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppLocalizations.of(context).translate('Notifications'),
          style: AppTextStyles.navigationTextStyle(context),
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: AppLocalizations.of(context).translate('All')),
                Tab(text: AppLocalizations.of(context).translate('System')),
                Tab(text: AppLocalizations.of(context).translate('Other')),
              ],
              isScrollable: false,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: AppTheme.getThemeExtension(context).primaryColor!,
              labelColor: AppTheme.getThemeExtension(context).primaryLightColor!,
              unselectedLabelColor: AppTheme.getThemeExtension(context).secondaryAltColor!,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  NotificationList(filter: "all"),
                  NotificationList(filter: "system"),
                  NotificationList(filter: "other"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationList extends StatefulWidget {
  final String filter;

  const NotificationList({super.key, required this.filter});

  @override
  State<NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  bool _isLoading = false;
  List<Notif.Notification> notifications = [];

  @override
  void initState() {
    super.initState();
    checkFirst();
  }

  Future<void> checkFirst() async {
    setState(() {
      _isLoading = true;
    });

    List<Notif.Notification> notif = await NotificationsController.loadNotifications();

    if(mounted) {
      setState(() {
        notifications = notif;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Filter and group the notifications based on the filter parameter
    List<Notif.Notification> filteredNotifications = notifications.where((notification) {
      if (widget.filter == "all") {
        return true;
      } else {
        return notification.type == widget.filter;
      }
    }).toList();

    // Group notifications by date
    Map<DateTime, List<Notif.Notification>> groupedNotifications = {};
    for (var notification in filteredNotifications) {
      DateTime date = DateTime.parse(notification.createdAt!);

      if (groupedNotifications.containsKey(date)) {
        groupedNotifications[date]!.add(notification);
      } else {
        groupedNotifications[date] = [notification];
      }
    }

    // Create list items with headers for each group
    List<Widget> listItems = [];
    groupedNotifications.forEach((date, notifications) {
      // Convert date to relative date for recent dates
      String header = DateFormat.yMMMd().format(date);
      if (DateTime.now().difference(date).inDays <= 0) {
        header = AppLocalizations.of(context).translate('Today');
      } else if (DateTime.now().difference(date).inDays <= 1) {
        header = AppLocalizations.of(context).translate('Yesterday');
      }
      // Add header
      listItems.add(
        ListTile(
          title: Text(
            header,
            style: TextStyle(fontWeight: FontWeight.bold,color: AppTheme.getThemeExtension(context).mainTextColor!),
          ),
        ),
      );
      // Add notification items
      for (var notification in notifications) {
        listItems.add(
          ListTile(
            leading: Icon(Icons.notifications_none,color: AppTheme.getThemeExtension(context).titleTextColor!),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      notification.title ?? AppLocalizations.of(context).translate('NoMessage'),
                      style: TextStyle(color: AppTheme.getThemeExtension(context).titleTextColor!),
                    ),
                    Spacer(),
                    Text(
                      notification.createdAt != null
                          ? DateFormat.yMMMd().format(DateTime.parse(notification.createdAt!))
                          : AppLocalizations.of(context).translate('NoDate'),
                      style: TextStyle(color: AppTheme.getThemeExtension(context).titleTextColor!),
                    )
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  notification.message ?? AppLocalizations.of(context).translate('NoMessage'),
                  style: TextStyle(color: AppTheme.getThemeExtension(context).titleTextColor!),
                ),
              ],
            ),
            onTap: () {
              // Handle notification tap
            },
          ),
        );
      }
    });

    return RefreshIndicator(
      onRefresh: checkFirst,
      child: _isLoading
          ? Center(
        child: CircularProgressIndicator(
          color: AppTheme.getThemeExtension(context).primaryColor!,
        ),
      )
          : listItems.isEmpty
          ? ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(50.0),
            child: Center(
              child: Text(
                AppLocalizations.of(context).translate('NoItemsFound'),
                style: TextStyle(color: AppTheme.getThemeExtension(context).titleTextColor!),
              ),
            ),
          )
        ],
      )
          : ListView(
        children: listItems,
      ),
    );
  }
}

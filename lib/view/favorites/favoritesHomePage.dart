import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../service/localization.dart';
import '../../utils/themes.dart';
import '../../widgets/custom/detailstext1.dart';
import '../../widgets/headerMiniCardWidget.dart';
import 'favoritePharmacy.dart';
import 'favoritedoctors.dart';
import 'favoritehospitals.dart';


class FavoritesHomePage extends StatefulWidget {
  const FavoritesHomePage({super.key});

  @override
  State<FavoritesHomePage> createState() => _FavoritesHomePageState();
}

class _FavoritesHomePageState extends State<FavoritesHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      body: Column(
        children: [
          const HeaderMiniCardWidget(title: "Favourites",),
          SizedBox(height: 8.0),

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
                    Text(localizations.translate("hospitals")),
                  ],
                ),
              ),
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
                    Text(localizations.translate("pharmacy")),
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
                    Text(localizations.translate("doctors")),
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
              children: const [FavoriteDoctors(), FavoriteHospitals(),FavoritePharmacy()],
            ),
          ),
        ],
      ),
    );
  }
}

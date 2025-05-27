import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'providers/themeProvider.dart';
import 'providers/localeProvider.dart';
import 'view/auth/splashScreen.dart';
import 'service/localization.dart';

// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter_android/webview_flutter_android.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // if (Platform.isAndroid) {
  //   WebViewPlatform.instance = SurfaceAndroidWebView();
  // }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);

    return MaterialApp(
      title: 'TeleMedicine',
      debugShowCheckedModeBanner: false,
      theme: themeProvider.theme,
      locale: localeProvider.locale,
      supportedLocales: const [
        Locale('en'),
        Locale('am'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home:  const SplashScreen(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_locator/utils/AppRoutes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

    // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Transparent status bar
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark// Dark text for status bar
    ));
    return GetMaterialApp(
      title: 'Store Locator',
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(textTheme).copyWith(
          bodyMedium: GoogleFonts.openSans(textStyle: textTheme.bodyMedium),
          bodySmall: GoogleFonts.openSans(textStyle: textTheme.bodySmall),
          bodyLarge: GoogleFonts.openSans(textStyle: textTheme.bodyLarge),
        ),
        cardTheme: CardTheme(
          surfaceTintColor: Colors.black,
          color: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent,
        ),
        useMaterial3: true,
      ),
      getPages: pages,
      initialRoute: AppRoutes.homeScreen2,
    );
  }
}


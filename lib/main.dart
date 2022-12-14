import 'package:empleados/constants.dart';
import 'package:empleados/splash.dart';
import 'package:flutter/cupertino.dart';

CupertinoThemeData ctheme() {
  return const CupertinoThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: CupertinoColors.systemBackground,
    textTheme: CupertinoTextThemeData(
      primaryColor: secondaryColor,
    ),
  );
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Empleados PdN',
      debugShowCheckedModeBanner: false,
      theme: ctheme(),
      home: Splash(),
    );
  }
}

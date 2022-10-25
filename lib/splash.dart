import 'dart:async';
import 'package:empleados/constants.dart';
import 'package:empleados/home.dart';
import 'package:flutter/cupertino.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 3, milliseconds: 0, microseconds: 0),
        onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(
          builder: (context) => const Home(),
        ),
        (route) => false);
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Image.asset(
                "assets/pdn-logo.png",
                height: 333,
              ),
            ),
            const SizedBox(
              height: 42.0,
            ),
            const Text(
              "empleados",
              style: tsH2Blue,
            ),
          ],
        ),
      ),
    );
  }
}

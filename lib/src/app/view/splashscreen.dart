import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bank_geek/src/app/routes/routegenerator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Timer(
      const Duration(seconds: 3),
          () => Navigator.pushReplacementNamed(
            context,
            RouteGenerator.ROTA_PRINCIPAL
          ),
      );
  }
  @override
  Widget build(BuildContext context) {
    if(defaultTargetPlatform == TargetPlatform.android){
      return Scaffold(
        body: Container(
          color: const Color( 0xff320995 ),
          padding: const EdgeInsets.all(60),
          child: Center(
            child: Image.asset('assets/images/splash.png'),
          ),
        ),
      );
    } else if(defaultTargetPlatform == TargetPlatform.iOS){
      return const Text('iOS');
    } else {
      return const Text('System not detected');
    }

  }
}

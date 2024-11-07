import 'package:flutter/material.dart';
import 'package:pockemon_r/repo/Pockemon.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PockemonRepo().getPockemonList();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        Text('splash screen'),
      ],
    ));
  }
}

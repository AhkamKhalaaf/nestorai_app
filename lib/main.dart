import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nestorai_app/Local_Service.dart';
import 'package:nestorai_app/ui/DetailScreen.dart';
import 'package:nestorai_app/ui/SearchHome.dart';
import 'package:nestorai_app/ui/Settingsscreen.dart';

void main() {
  SetUpLocator();
  runApp(MyApp());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: SeachHome(),
      routes: {
        SettingsScreen.routname:(context)=>SettingsScreen(),

      },
    );
  }
}


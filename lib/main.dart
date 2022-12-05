import 'package:flutter/material.dart';
import 'package:helloworld/configure_phonenumber.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.yellow,
      ),
      home: const PhoneNumberConfigureScreen(
        phoneNumber: "+919999999999",
        isDefaultCallerId: true,
        tags: {
          "Personal": Color(0xffb74093),
          "family": Color(0xFFFFFFFF),
          "stranger": Color(0xFFF44336),
          "Transaction and otp": Color.fromARGB(255, 40, 16, 162),
          "Add new+": Color.fromARGB(255, 54, 235, 244),
        },
        colors: [
          Color(0xffb74093),
          Color(0xFFFFFFFF),
          Color(0xFFFFFFFF),
          Color(0xFFFFFFFF),
          Color(0xFFFFFFFF),
          Color(0xFFF44336),
          Color.fromARGB(255, 186, 39, 29),
          Color.fromARGB(255, 90, 10, 4),
          Color.fromARGB(255, 117, 51, 129),
          Color.fromARGB(255, 194, 178, 184),
          Color.fromARGB(255, 188, 156, 17),
          Color.fromARGB(255, 12, 152, 150),
          Color.fromARGB(255, 54, 235, 244),
          Color.fromARGB(255, 40, 16, 162),
          Color.fromARGB(255, 227, 44, 15),
        ],
      ),
    );
  }
}

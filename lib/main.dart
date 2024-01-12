import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:muscat_car_wash/view/admin/adminHomeScreen/admin_home_screen.dart';
import 'package:muscat_car_wash/view/carOwner/carOwnerHome/car_owner_home.dart';
import 'package:muscat_car_wash/view/dashboard/dashboard_view.dart';
import 'package:muscat_car_wash/view/splash/splash_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Firebase.apps.length == 0) {
    if (Platform.isIOS) {
      await Firebase.initializeApp(
          options: FirebaseOptions(
        apiKey: 'AIzaSyB2EibisvkRWDkcvmYNGRHQCKCHcXMYBDU',
        appId: '1:138743974989:ios:3fdf1dc625b2301209e004',
        messagingSenderId: '138743974989',
        projectId: 'muscat-car-wash0-8b907',
        storageBucket: 'muscat-car-wash0-8b907.appspot.com',
        iosBundleId: 'com.example.muscatCarWash',
      ));
    } else {
      await Firebase.initializeApp(
          options: FirebaseOptions(
        apiKey: 'AIzaSyDNliysN8mWFo5KgwnNnEM9vMZEGDgquuY',
        appId: '1:138743974989:android:1d2810ea7605ecfa09e004',
        messagingSenderId: '138743974989',
        projectId: 'muscat-car-wash0-8b907',
        storageBucket: 'muscat-car-wash0-8b907.appspot.com',
      ));
    }
  }

  runApp(const MyApp());
}

class FadePageRoute<T> extends PageRoute<T> {
  final WidgetBuilder builder;

  FadePageRoute({required this.builder})
      : super(
          fullscreenDialog: false,
        );

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String get barrierLabel => '';

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 500);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  String userType = '', email = '', uid = '';

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('Starting usertype ' + prefs.getString('userType').toString());
    if (prefs.getString('userType') != null) {
      setState(() {
        userType = prefs.getString('userType')!;
        email = prefs.getString('userEmail')!;
        // uid = prefs.getString('userId')!;
      });
      print(userType.toString() + ' This is user type');
    } else {
      print('Starting usertype');
    }
  }

  @override
  void initState() {
    print('Starting usertype');
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
      ),
      home: userType == 'Users'
          ? DashboardView()
          : userType == 'Owner'
              ? CarOwnerHomeScreen()
              : userType == 'Admin'
                  ? AdminHomeScreen()
                  : SplashView(),
    );
  }
}

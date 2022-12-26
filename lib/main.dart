import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/screen/dashboard/dashboard.dart';
import 'package:hslr/screen/login/login.dart';
import 'package:hslr/screen/splashscreen/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sessionlog;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sessionlog = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    // TODO: implement initState
    sessionlogin();
    super.initState();
  }

  var user;
  @override
  void sessionlogin() async {
    // SharedPreferences sessionlog = await SharedPreferences.getInstance();
    // user = sessionlog.getString('log_name');
    // if (user == null) {
    //   Get.to(Login());
    // } else {
    //   print(user.toString());
    //   Get.to(Dashboard());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'shlr'.toUpperCase(),
      theme: ThemeData(primarySwatch: Colors.blue //#4e98f5
          ),
      home: user == null ? const Splashscreen() : const Dashboard()
      // home: Test(),
    );
  }
}

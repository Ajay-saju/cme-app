import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hslr/screen/online_cmeprog/local_database/video_list_model.dart';
import 'package:hslr/screen/splashscreen/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sessionlog;

void main() async {
  FlutterDownloader.initialize();
  WidgetsFlutterBinding.ensureInitialized();
  FlutterDownloader.initialize(debug: true, ignoreSsl: true);
  sessionlog = await SharedPreferences.getInstance();
  await Hive.initFlutter();
  Hive.registerAdapter(VideoListModelAdapter());
  await Hive.openBox<VideoListModel>('video_list');
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
        home: Splashscreen()
        // home: Test(),
        );
  }
}

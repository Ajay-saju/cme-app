import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/screen/cmeprogrm_points/cme_points.dart';
import 'package:hslr/screen/login/login_controller.dart';
import 'package:hslr/screen/online_cmeprog/online_cmeprogram.dart';

class CmeProgram extends StatefulWidget {
  const CmeProgram({Key? key}) : super(key: key);

  @override
  State<CmeProgram> createState() => _CmeProgramState();
}

class _CmeProgramState extends State<CmeProgram> {
  LoginController logController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: ((_) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            // backgroundColor: Colors.grey,

            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: context.height * 0.09,
                    width: context.width,
                    color: Colors.white, //Color(0xff63c3fe),
                    child: Center(
                      child: Text(
                        'CME Program',
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(Onlinecmeprogram());
                    },
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 50),
                        height: context.height * 0.06,
                        width: context.width * 0.7,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade700,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                          child: Text(
                            "Online CME Program",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to( Cmepoints());
                    },
                    child: Center(
                      child: Container(
                        margin:const EdgeInsets.only(top: 20),
                        height: context.height * 0.08,
                        width: context.width * 0.7,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade700,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                          child: Text(
                            "Attended CME Program and CME Points",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

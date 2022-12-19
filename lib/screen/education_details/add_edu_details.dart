import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/screen/education_details/education_controller.dart';

class AddEducationDetails extends StatefulWidget {
  const AddEducationDetails({Key? key}) : super(key: key);

  @override
  State<AddEducationDetails> createState() => _AddEducationDetailsState();
}

class _AddEducationDetailsState extends State<AddEducationDetails> {
  final eduController = Get.find<EducationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white, //Color(0xff63c3fe),
        body: SafeArea(
          child: Form(
            key: eduController.formkey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/R.png',
                              height: 15,
                              width: 20,
                              fit: BoxFit.cover,
                            ),
                            // Spacer(),
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              "Members Details",
                              style: TextStyle(
                                  fontFamily: "Nunito",
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 20),
                  //   child: Center(
                  //     child: Container(
                  //       margin: EdgeInsets.only(top: 0),
                  //       height: 50, //context.height * 0.06,
                  //       width: context.width * 0.9,
                  //       padding:
                  //           EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  //       decoration: BoxDecoration(
                  //           // color: Color(0xffDC3638),
                  //           borderRadius: BorderRadius.circular(10.0),
                  //           border: Border.all(color: Colors.black)),
                  //       child: DropdownButtonHideUnderline(
                  //         child: DropdownButton<String>(
                  //             value: eduController.dropvalue,
                  //             isExpanded: true,
                  //             icon: Padding(
                  //               padding: const EdgeInsets.only(left: 8.0),
                  //               child: Image.asset(
                  //                 'assets/Dropdownb.png',
                  //                 color: Color(0xffDC3638),
                  //               ),
                  //             ),
                  //             hint: Text(
                  //               "  Select Profession",
                  //               style: TextStyle(
                  //                   fontFamily: "Nunito",
                  //                   color: Colors.black87),
                  //             ),
                  //             items: eduController.dropitems
                  //                 .map(eduController.buildMenuItem)
                  //                 .toList(),
                  //             onChanged: (value) {
                  //               eduController.dropvalue = value;
                  //               eduController.update();
                  //             }),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ));
  }
}

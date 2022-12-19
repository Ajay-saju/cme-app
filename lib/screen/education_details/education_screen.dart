import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hslr/screen/education_details/add_edu_details.dart';
import 'package:hslr/screen/education_details/education_controller.dart';

class EducationDetailsScreen extends StatefulWidget {
  const EducationDetailsScreen({Key? key}) : super(key: key);

  @override
  State<EducationDetailsScreen> createState() => _EducationDetailsScreenState();
}

class _EducationDetailsScreenState extends State<EducationDetailsScreen> {
  EducationController educationController = Get.put(EducationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
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
                      "Education Details",
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
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 40,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Sl No',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Nunito",
                                fontWeight: FontWeight.bold,
                                color:
                                    Color(0xffDC3638) // Colors.blue.shade700,//
                                ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0),
                        height: 60,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black, width: 1),
                            top: BorderSide(color: Colors.black, width: 1),
                            right: BorderSide(color: Colors.black, width: 1),
                            left: BorderSide(color: Colors.black, width: 1),
                            // left:
                            //     BorderSide(color: Colors.black, width: 1)

                            // left:
                            //     BorderSide(color: Colors.black, width: 1)
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '1',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Nunito",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: cros,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 40,
                        width: 75,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black, width: 1),
                              right: BorderSide(color: Colors.black, width: 1),
                              top: BorderSide(color: Colors.black, width: 1)),
                        ),
                        child: Center(
                          child: Text(
                            'Degree',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Nunito",
                              fontWeight: FontWeight.bold,
                              color: Color(0xffDC3638),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0),
                        height: 60,
                        width: 75,
                        decoration: BoxDecoration(
                          // bottom:
                          //     BorderSide(color: Colors.black, width: 1),
                          border: Border(
                            bottom: BorderSide(color: Colors.black, width: 1),
                            top: BorderSide(color: Colors.black, width: 1),
                            right: BorderSide(color: Colors.black, width: 1),
                            // left:
                            //     BorderSide(color: Colors.black, width: 1)

                            // left:
                            //     BorderSide(color: Colors.black, width: 1)
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'DM (Cl.Haem.)',
                            style:
                                TextStyle(fontSize: 14, fontFamily: "Nunito"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 40,
                        width: 72,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black, width: 1),
                              right: BorderSide(color: Colors.black, width: 1),
                              top: BorderSide(color: Colors.black, width: 1)),
                        ),
                        child: Center(
                          child: Text(
                            'College',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Nunito",
                              fontWeight: FontWeight.bold,
                              color: Color(0xffDC3638),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0),
                        height: 60,
                        width: 72,
                        decoration: BoxDecoration(
                          // bottom:
                          //     BorderSide(color: Colors.black, width: 1),
                          border: Border(
                            bottom: BorderSide(color: Colors.black, width: 1),
                            top: BorderSide(color: Colors.black, width: 1),
                            right: BorderSide(color: Colors.black, width: 1),
                            // left:
                            //     BorderSide(color: Colors.black, width: 1)

                            // left:
                            //     BorderSide(color: Colors.black, width: 1)
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'RCR U.K',
                            style:
                                TextStyle(fontSize: 14, fontFamily: "Nunito"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black, width: 1),
                              right: BorderSide(color: Colors.black, width: 1),
                              top: BorderSide(color: Colors.black, width: 1)),
                        ),
                        child: Center(
                          child: Text(
                            'University',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                fontFamily: "Nunito",
                                color: Color(
                                  0xffDC3638,
                                )),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0),
                        height: 60,
                        width: 90,
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(color: Colors.black, width: 1),
                          top: BorderSide(color: Colors.black, width: 1),
                          right: BorderSide(color: Colors.black, width: 1),
                        )),
                        child: Center(
                          child: Text(
                            'The Royal\n Collage of\n Radiologist',
                            style:
                                TextStyle(fontSize: 14, fontFamily: "Nunito"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black, width: 1),
                              right: BorderSide(color: Colors.black, width: 1),
                              top: BorderSide(color: Colors.black, width: 1)),
                        ),
                        child: Center(
                          child: Text(
                            'Year of\nPassing',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Nunito",
                                fontSize: 14,
                                color: Color(
                                  0xffDC3638,
                                )),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0),
                        height: 60,
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black, width: 1),
                            top: BorderSide(color: Colors.black, width: 1),
                            right: BorderSide(color: Colors.black, width: 1),
                            // left:
                            //     BorderSide(color: Colors.black, width: 1)
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'February \n2022',
                            style:
                                TextStyle(fontSize: 13, fontFamily: "Nunito"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 40,
                        width: 140,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black, width: 1),
                              right: BorderSide(color: Colors.black, width: 1),
                              top: BorderSide(color: Colors.black, width: 1)),
                        ),
                        child: Center(
                          child: Text(
                            'Action',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Nunito",
                                fontSize: 14,
                                color: Color(
                                  0xffDC3638,
                                )),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0),
                        height: 60,
                        width: 140,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black, width: 1),
                            top: BorderSide(color: Colors.black, width: 1),
                            right: BorderSide(color: Colors.black, width: 1),
                            // left:
                            //     BorderSide(color: Colors.black, width: 1)
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                child: Text(
                                  'View',
                                  style: TextStyle(fontFamily: "Nunito"),
                                )),
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                child: Text(
                                  'Edit',
                                  style: TextStyle(fontFamily: "Nunito"),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ],

                // textDirection: Axis.horizontal,

                // children: [
                //   buildRow([
                //     'Cell 1',
                //     'Cell 2',
                //     'Cell 3',
                //     'Cell 4',
                //     'Cell 5',
                //   ]),
                // ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(AddEducationDetails());
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              child: Text(
                'Add',
                style: TextStyle(fontFamily: "Nunito"),
              )),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  'Showing 1 of 1 Entries',
                  style: TextStyle(fontSize: 18, fontFamily: "Nunito"
                      // color: Colors.blue.shade700,
                      ),
                ),
                Spacer(),

                // Padding(
                //   padding: const EdgeInsets.only(left: 8.0),
                //   child: Image.asset(
                //     'assets/hj.png',
                //     height: 25,
                //   ),
                // ),
              ],
            ),
          ),
          Spacer(),
          Row(
            children: [
              SizedBox(
                width: 180,
              ),
              Container(
                height: 40,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    '1',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          )
        ],
      )),
    );
  }
}

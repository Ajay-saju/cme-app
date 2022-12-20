import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/screen/education_details/add_edu_details.dart';
import 'package:hslr/screen/education_details/edit_details.dart';
import 'package:hslr/screen/education_details/education_controller.dart';

// EducationController educationController = Get.put(EducationController());

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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ElevatedButton(
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
              ),
            ],
          ),
          // SizedBox(
          //   height: 10,
          // ),
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
                                onPressed: () {
                                  Get.defaultDialog(
                                      title: 'Education Details',
                                      middleText: '',
                                      content: Column(
                                        children: [
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                '  Degree :',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: "Nunito",
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 50,
                                              ),
                                              Text(
                                                'DM (Cl.Heam)',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: "Nunito",
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                'College :',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: "Nunito",
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 50,
                                              ),
                                              Text(
                                                'RCR U.K         ',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: "Nunito",
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'University :',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: "Nunito",
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 50,
                                              ),
                                              Text(
                                                'The Royal Collage\n of Radiology',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: "Nunito",
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Year of passing :',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: "Nunito",
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'Feb 2022',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: "Nunito",
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          )
                                        ],
                                      )

                                      //  Row(
                                      //   children: [
                                      //     Column(
                                      //       mainAxisAlignment:
                                      //           MainAxisAlignment.start,
                                      //       children: [
                                      //         Text('               Degree :'),
                                      //         SizedBox(
                                      //           height: 10,
                                      //         ),
                                      //
                                      //         SizedBox(
                                      //           height: 10,
                                      //         ),
                                      //         Text('          University :'),
                                      //         SizedBox(
                                      //           height: 10,
                                      //         ),
                                      //         Text('Year of passing :'),
                                      //         SizedBox(
                                      //           height: 10,
                                      //         ),
                                      //       ],
                                      //     ),
                                      //     Column(
                                      //       mainAxisAlignment:
                                      //           MainAxisAlignment.start,
                                      //       children: [
                                      //
                                      //         SizedBox(
                                      //           height: 20,
                                      //         ),
                                      //         Text('RCR U.K     '),
                                      //         SizedBox(
                                      //           height: 10,
                                      //         ),
                                      //         Text(
                                      //             'The Royal Collage\n of Radiology'),
                                      //         Text('Feb 2022')
                                      //       ],
                                      //     )
                                      //   ],
                                      // )
                                      );
                                },
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
                                onPressed: () {
                                  Get.to(EditEduDetails());
                                },
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
          // SizedBox(
          //   height: 50,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(
              //   width: 180,
              // ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                    child: Icon(
                  Icons.keyboard_double_arrow_left_rounded,
                  color: Colors.white,
                )),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                    child: Icon(
                  Icons.keyboard_arrow_left_rounded,
                  color: Colors.white,
                )),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Color(0xffDC3638),
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
              SizedBox(
                width: 10,
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    '2',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    '3',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                    child: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Colors.white,
                )),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                    child: Icon(
                  Icons.keyboard_double_arrow_right_rounded,
                  color: Colors.white,
                )),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  'Showing 1 of 1 Entries',
                  style: TextStyle(fontSize: 14, fontFamily: "Nunito"
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
        ],
      )),
    );
  }
}

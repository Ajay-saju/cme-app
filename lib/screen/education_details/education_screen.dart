import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/screen/dashboard/dashboard.dart';
import 'package:hslr/screen/education_details/add_edu_details.dart';
import 'package:hslr/screen/education_details/edit_details.dart';
import 'package:hslr/screen/education_details/education_controller.dart';

import '../dashboard/dashboard_controller.dart';

// EducationController educationController = Get.put(EducationController());

class EducationDetailsScreen extends StatefulWidget {
  const EducationDetailsScreen({Key? key}) : super(key: key);

  @override
  State<EducationDetailsScreen> createState() => _EducationDetailsScreenState();
}

class _EducationDetailsScreenState extends State<EducationDetailsScreen> {
  EducationController educationController = Get.put(EducationController());
  final dashControll = Get.find<DashboardController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // dashControll.getEduList();
  }

  @override
  Widget build(BuildContext context) {
    var eduData = dashControll.eduList.value.result;
    return WillPopScope(
      onWillPop: () async {
        Get.off(Dashboard());
        return true;
      },
      child: Scaffold(
        body: Obx(() {
          return SafeArea(
              child: educationController.eduIdList.value!.massege == null
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                        strokeWidth: 1.5,
                      ),
                    )
                  : Column(
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
                            Get.off(Dashboard());
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

                        eduData == null
                            ? Center(
                                child: Text(
                                  'No Data Available',
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              )
                            : Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Expanded(
                                      child: ListView.separated(
                                          itemBuilder: (context, index) =>
                                              Container(
                                                height:
                                                    context.height * .65 / 2,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.0)),
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                          separatorBuilder: (context, index) =>
                                              SizedBox(
                                                height: 10,
                                              ),
                                          itemCount: eduData.length),
                                    ),

                                    //  _createDataTable(eduData),
                                  ),
                                ],
                              ),

                        SizedBox(
                          height: 30,
                        ),
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
                                style:
                                    TextStyle(fontSize: 14, fontFamily: "Nunito"
                                        // color: Colors.blue.shade700,
                                        ),
                              ),

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
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ));
        }),
      ),
    );
  }

  _createDataTable(eduData) {
    return DataTable(
      columns: _createColumns(),
      rows: _createRows(eduData),
      dataRowHeight: 50,
      dataTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: "Nunito",
          fontSize: 14,
          color: Colors.black),
      border: TableBorder(
          right: BorderSide(
            width: 1,
            color: Colors.black87,
          ),
          horizontalInside: BorderSide(
            width: 1,
            color: Colors.black87,
          ),
          verticalInside: BorderSide(
            width: 1,
            color: Colors.black87,
          ),
          bottom: BorderSide(
            width: 1,
            color: Colors.black87,
          ),
          left: BorderSide(
            width: 1,
            color: Colors.black87,
          ),
          top: BorderSide(
            width: 1,
            color: Colors.black87,
          )),
    );
  }

  _createRows(eduData) {
    return List<DataRow>.generate(
        eduData.length,
        (index) => DataRow(cells: [
              DataCell(Center(child: Text((index + 1).toString()))),
              DataCell(Center(child: Text(eduData[index].dEGREE.toString()))),
              DataCell(Center(child: Text(eduData[index].cOLLEGE.toString()))),
              DataCell(
                  Center(child: Text(eduData[index].uNIVERSITY.toString()))),
              DataCell(Center(child: Text(eduData[index].yEAROFPASSING))),
              DataCell(Center(
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(EditEduDetails(
                        index: index,
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    child: Text(
                      'Edit',
                      style: TextStyle(fontFamily: "Nunito"),
                    )),
              )),
            ]));
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(
        label: Center(
          child: Text(
            'Sl No',
            style: TextStyle(
                fontSize: 15,
                fontFamily: "Nunito",
                fontWeight: FontWeight.bold,
                color: Color(0xffDC3638) // Colors.blue.shade700,//
                ),
          ),
        ),
      ),
      DataColumn(
        label: Center(
          child: Text(
            'Degree',
            style: TextStyle(
                fontSize: 15,
                fontFamily: "Nunito",
                fontWeight: FontWeight.bold,
                color: Color(0xffDC3638) // Colors.blue.shade700,//
                ),
          ),
        ),
      ),
      DataColumn(
        label: Center(
          child: Text(
            'College',
            style: TextStyle(
                fontSize: 15,
                fontFamily: "Nunito",
                fontWeight: FontWeight.bold,
                color: Color(0xffDC3638) // Colors.blue.shade700,//
                ),
          ),
        ),
      ),
      DataColumn(
        label: Center(
          child: Text(
            'University',
            style: TextStyle(
                fontSize: 15,
                fontFamily: "Nunito",
                fontWeight: FontWeight.bold,
                color: Color(0xffDC3638) // Colors.blue.shade700,//
                ),
          ),
        ),
      ),
      DataColumn(
        label: Center(
          child: Text(
            'Year of Passing',
            style: TextStyle(
                fontSize: 15,
                fontFamily: "Nunito",
                fontWeight: FontWeight.bold,
                color: Color(0xffDC3638) // Colors.blue.shade700,//
                ),
          ),
        ),
      ),
      DataColumn(
        label: Center(
          child: Text(
            'Action',
            style: TextStyle(
                fontSize: 15,
                fontFamily: "Nunito",
                fontWeight: FontWeight.bold,
                color: Color(0xffDC3638) // Colors.blue.shade700,//
                ),
          ),
        ),
      ),
    ];
  }
}

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:hslr/screen/cmeprogrm_points/certificate_pdf.dart';
import 'package:hslr/screen/login/login_controller.dart';
import 'package:hslr/screen/member_details/member_controller.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../dashboard/dashboard_controller.dart';

class Cmepoints extends StatefulWidget {
  const Cmepoints({Key? key}) : super(key: key);

  @override
  State<Cmepoints> createState() => _CmepointsState();
}

class _CmepointsState extends State<Cmepoints> {
  MemberDetailsController mebController = Get.put(MemberDetailsController());

  TableRow buildRow(List<String> cells) =>
      TableRow(children: cells.map((cell) => Text(cell)).toList());
  final dashbordControll = Get.find<DashboardController>();
  @override
  Widget build(BuildContext context) {
    var cmeData = dashbordControll.cmeList.value.list;
    return GetBuilder<MemberDetailsController>(
      builder: ((_) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: Colors.white, //Color(0xff63c3fe),
            body: SafeArea(
                child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                              "Attented CME",
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: _CreateDataTable(cmeData),
                    ),
                  ),

                  //           children: [
                  //             Container(
                  //               margin: EdgeInsets.only(top: 10),
                  //               height: 60,
                  //               width: 80,
                  //               decoration: BoxDecoration(
                  //                 border: Border(
                  //                     bottom: BorderSide(
                  //                         color: Colors.black, width: 1),
                  //                     right: BorderSide(
                  //                         color: Colors.black, width: 1),
                  //                     top: BorderSide(
                  //                         color: Colors.black, width: 1)),
                  //               ),
                  //               child: Center(
                  //                 child: Text(
                  //                   '  Passed\nQuestons',
                  //                   style: TextStyle(
                  //                       fontSize: 15,
                  //                       fontFamily: "Nunito",
                  //                       fontWeight: FontWeight.bold,
                  //                       color: Color(0xffDC3638)),
                  //                 ),
                  //               ),
                  //             ),
                  //             Container(
                  //               margin: EdgeInsets.only(top: 0),
                  //               height: 50,
                  //               width: 80,
                  //               decoration: BoxDecoration(
                  //                 border: Border(
                  //                   top: BorderSide(
                  //                       color: Colors.black, width: 1),
                  //                   right: BorderSide(
                  //                       color: Colors.black, width: 1),
                  //                   // left:
                  //                   //     BorderSide(color: Colors.black, width: 1)
                  //                 ),
                  //               ),
                  //               child: Center(
                  //                 child: Text(
                  //                   '8',
                  //                   style: TextStyle(fontSize: 14),
                  //                 ),
                  //               ),
                  //             ),
                  //             Container(
                  //               margin: EdgeInsets.only(top: 0),
                  //               height: 50,
                  //               width: 80,
                  //               decoration: BoxDecoration(
                  //                 border: Border(
                  //                   top: BorderSide(
                  //                       color: Colors.black, width: 1),
                  //                   // bottom:
                  //                   //     BorderSide(color: Colors.black, width: 1),
                  //                   right: BorderSide(
                  //                       color: Colors.black, width: 1),
                  //                   // left:
                  //                   //     BorderSide(color: Colors.black, width: 1)
                  //                 ),
                  //               ),
                  //               child: Center(
                  //                 child: Text(
                  //                   '7',
                  //                   style: TextStyle(
                  //                     fontSize: 14,
                  //                     fontFamily: "Nunito",
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //             Container(
                  //               margin: EdgeInsets.only(top: 0),
                  //               height: 50,
                  //               width: 80,
                  //               decoration: BoxDecoration(
                  //                 border: Border(
                  //                   bottom: BorderSide(
                  //                       color: Colors.black, width: 1),
                  //                   top: BorderSide(
                  //                       color: Colors.black, width: 1),
                  //                   right: BorderSide(
                  //                       color: Colors.black, width: 1),
                  //                   // left:
                  //                   //     BorderSide(color: Colors.black, width: 1)
                  //                 ),
                  //               ),
                  //               child: Center(
                  //                 child: Text(
                  //                   '9',
                  //                   style: TextStyle(
                  //                     fontSize: 14,
                  //                     fontFamily: "Nunito",
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),

                  SizedBox(
                    height: 20,
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
                    padding: const EdgeInsets.all(20.0),
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
              ),
            )),
          ),
        );
      }),
    );
  }

  DataTable _CreateDataTable(data) {
    return DataTable(
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
        dataRowHeight: 50,
        columns: _createColumns(),
        dataTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Nunito",
            fontSize: 14,
            color: Colors.black),
        rows: List<DataRow>.generate(
            data.length,
            (index) => DataRow(cells: [
                  DataCell(Center(
                    child: Text(
                      (index + 1).toString(),
                    ),
                  )),
                  DataCell(
                      Center(child: Text(data[index].videoName.toString()))),
                  DataCell(
                      Center(child: Text(data[index].createdOn.toString()))),
                  DataCell(
                      Center(child: Text(data[index].attendedDate.toString()))),
                  DataCell(Center(child: Text(data[index].attempt.toString()))),
                  DataCell(Center(
                      child: Text(data[index].creditPointsNumber.toString()))),
                  DataCell(
                    InkWell(
                      onTap: () async {
                        Get.defaultDialog(
                            title: 'Download PDF',
                            titleStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Nunito",
                                fontSize: 18,
                                color: Colors.black),
                            middleText:
                                'Do you want to download the certificate as PDF?',
                            middleTextStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Nunito",
                                fontSize: 16,
                                color: Colors.black),
                            actions: [
                              ElevatedButton(
                                onPressed: () async {
                                  await openPdf(
                                      filename: 'example.pdf',
                                      url: data[index].cmeCertLink);
                                },
                                child: Text(
                                  'Yes',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Nunito",
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    )),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Nunito",
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    )),
                              )
                            ]);
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Image.asset(
                            'assets/hj.png',
                            height: 25,
                          ),
                        ),
                      ),
                    ),
                  )
                ])));
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(
        label: Center(
          child: Text(
            'No',
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
            'Program Name',
            style: TextStyle(
              fontSize: 15,
              fontFamily: "Nunito",
              fontWeight: FontWeight.bold,
              color: Color(0xffDC3638),
            ),
          ),
        ),
      ),
      DataColumn(
        label: Center(
          child: Text(
            'Program Date',
            style: TextStyle(
              fontSize: 15,
              fontFamily: "Nunito",
              fontWeight: FontWeight.bold,
              color: Color(0xffDC3638),
            ),
          ),
        ),
      ),
      DataColumn(
        label: Center(
          child: Text(
            'Attended Date',
            style: TextStyle(
              fontSize: 15,
              fontFamily: "Nunito",
              fontWeight: FontWeight.bold,
              color: Color(0xffDC3638),
            ),
          ),
        ),
      ),
      DataColumn(
        label: Center(
          child: Text(
            'Attempts',
            style: TextStyle(
              fontSize: 15,
              fontFamily: "Nunito",
              fontWeight: FontWeight.bold,
              color: Color(0xffDC3638),
            ),
          ),
        ),
      ),
      DataColumn(
        label: Center(
          child: Text(
            'Credit Points',
            style: TextStyle(
              fontSize: 15,
              fontFamily: "Nunito",
              fontWeight: FontWeight.bold,
              color: Color(0xffDC3638),
            ),
          ),
        ),
      ),
      DataColumn(
        label: Center(
          child: Text(
            'Certificate',
            style: TextStyle(
              fontSize: 15,
              fontFamily: "Nunito",
              fontWeight: FontWeight.bold,
              color: Color(0xffDC3638),
            ),
          ),
        ),
      )
    ];
  }

  Future openPdf({required String url, required String filename}) async {
    final file = await downloadPdf(url, filename);

    if (file == null) return null;
    print('Path:${file.path}');
    OpenFile.open(file.path);
  }

  Future<File?> downloadPdf(String url, String filename) async {
    final dio = Dio();
    final appStore = await getApplicationDocumentsDirectory();
    final file = File('&{appStore.path}/$filename');

    try {
      final response = await dio.get(url,
          options: Options(
              followRedirects: false, responseType: ResponseType.bytes));
      final ref = file.openSync(mode: FileMode.write);
      ref.writeFromSync(response.data);
      await ref.close;
      return file;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
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
  final ScrollController _scrollController = ScrollController();
  List<String> _data = List.generate(10, (index) => 'Item $index');

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      // Reach the end of the list, load more data
      setState(() {
        _data.addAll(
            List.generate(10, (index) => 'Item ${_data.length + index}'));
      });
    }
  }

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
                  cmeData == null && cmeData == []
                      ? Center(
                          child: Text(
                          'No Data Available',
                          style: TextStyle(
                            fontFamily: "Nunito",
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ))
                      : Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Container(
                                      padding: EdgeInsets.all(10),

                                      // height: context.height * .55 / 2,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Table(
                                            columnWidths: {
                                              0: FlexColumnWidth(3),
                                              1: FlexColumnWidth(0.3),
                                              2: FlexColumnWidth(4),
                                            },
                                            children: [
                                              TableRow(children: [
                                                Text(
                                                  'Program name',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "Nunito",
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                ),
                                                Text(
                                                  ':',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  cmeData![index]
                                                      .videoName
                                                      .toString(),
                                                  maxLines: 3,
                                                  style: TextStyle(
                                                      fontFamily: "Nunito",
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                ),
                                              ]),
                                              TableRow(children: [
                                                Text(
                                                  'Attended date',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "Nunito",
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                ),
                                                Text(
                                                  ':',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  cmeData[index]
                                                      .attendedDate
                                                      .toString(),
                                                  maxLines: 3,
                                                  style: TextStyle(
                                                      fontFamily: "Nunito",
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                ),
                                              ]),
                                              TableRow(children: [
                                                Text(
                                                  'Attempts',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "Nunito",
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                ),
                                                Text(
                                                  ':',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  cmeData[index]
                                                      .attempt
                                                      .toString(),
                                                  maxLines: 3,
                                                  style: TextStyle(
                                                      fontFamily: "Nunito",
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                ),
                                              ]),
                                              TableRow(children: [
                                                Text(
                                                  'Credit points',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "Nunito",
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                ),
                                                Text(
                                                  ':',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  cmeData[index]
                                                      .creditPointsNumber
                                                      .toString(),
                                                  maxLines: 3,
                                                  style: TextStyle(
                                                      fontFamily: "Nunito",
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                ),
                                              ])
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          ElevatedButton(
                                              onPressed: () {
                                                Get.defaultDialog(
                                                    title: 'Download PDF',
                                                    titleStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: "Nunito",
                                                        fontSize: 18,
                                                        color: Colors.black),
                                                    middleText:
                                                        'Do you want to download the certificate as PDF?',
                                                    middleTextStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: "Nunito",
                                                        fontSize: 16,
                                                        color: Colors.black),
                                                    actions: [
                                                      ElevatedButton(
                                                        onPressed: () async {
                                                          var link =
                                                              cmeData[index]
                                                                  .cmeCertLink!
                                                                  .replaceAll(
                                                                      'https',
                                                                      'http');
                                                          await openPdf(
                                                            filename:
                                                                '${cmeData[index].videoName}.pdf',
                                                            url:
                                                                link.replaceAll(
                                                                    '"', ''),
                                                          );
                                                          Get.back();
                                                        },
                                                        child: Text(
                                                          'Yes',
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontFamily:
                                                                "Nunito",
                                                          ),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    Colors
                                                                        .black,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
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
                                                            fontFamily:
                                                                "Nunito",
                                                          ),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    Colors
                                                                        .black,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                )),
                                                      )
                                                    ]);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.black,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  )),
                                              child: Text(
                                                'Print Certificate',
                                                style: TextStyle(
                                                    fontFamily: "Nunito"),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 10,
                                  ),
                              itemCount: cmeData!.length < 10
                                  ? cmeData.length
                                  : _data.length),
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
                                  var link = data[index]
                                      .cmeCertLink
                                      .replaceAll('https', 'http');
                                  await openPdf(
                                    filename: 'example.pdf',
                                    url: link.replaceAll('"', ''),
                                  );
                                  Get.back();
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
    Uint8List fileBytes = file.readAsBytesSync();
    String base64String = base64Encode(fileBytes);

    print('Path:${file.path}');
    OpenFile.open(file.path);
  }

  Future<File?> downloadPdf(String url, String filename) async {
    final dio = Dio();
    final appStore = await getApplicationDocumentsDirectory();
    final file = File('${appStore.path}/$filename');

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

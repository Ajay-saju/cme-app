import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/screen/member_details/member_controller.dart';
import 'package:hslr/screen/paymentdetails/pdf_api.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({Key? key}) : super(key: key);

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  final pdf = pw.Document();
  MemberDetailsController mebController = Get.put(MemberDetailsController());

  TableRow buildRow(List<String> cells) =>
      TableRow(children: cells.map((cell) => Text(cell)).toList());
  @override
  Widget build(BuildContext context) {
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
                              "Payment Details",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Nunito",
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
                                width: 25,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'No',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.bold,
                                        color: Color(
                                            0xffDC3638) // Colors.blue.shade700,//
                                        ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 25,
                                decoration: BoxDecoration(
                                  border: Border(
                                      // bottom:
                                      //     BorderSide(color: Colors.black, width: 1),
                                      right: BorderSide(
                                          color: Colors.black, width: 1),
                                      left: BorderSide(
                                          color: Colors.black, width: 1)),
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
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 25,
                                decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color: Colors.black, width: 1),
                                      // bottom:
                                      //     BorderSide(color: Colors.black, width: 1),
                                      right: BorderSide(
                                          color: Colors.black, width: 1),
                                      left: BorderSide(
                                          color: Colors.black, width: 1)),
                                ),
                                child: Center(
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                        fontSize: 14, fontFamily: "Nunito"),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 25,
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black, width: 1),
                                      top: BorderSide(
                                          color: Colors.black, width: 1),
                                      right: BorderSide(
                                          color: Colors.black, width: 1),
                                      left: BorderSide(
                                          color: Colors.black, width: 1)),
                                ),
                                child: Center(
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                        fontSize: 14, fontFamily: "Nunito"),
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
                                      bottom: BorderSide(
                                          color: Colors.black, width: 1),
                                      right: BorderSide(
                                          color: Colors.black, width: 1),
                                      top: BorderSide(
                                          color: Colors.black, width: 1)),
                                ),
                                child: Center(
                                  child: Text(
                                    'Program\n  Name',
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
                                height: 50,
                                width: 75,
                                decoration: BoxDecoration(
                                  border: Border(
                                    // bottom:
                                    //     BorderSide(color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Progaram 1',
                                    style: TextStyle(
                                        fontSize: 14, fontFamily: "Nunito"),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 75,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    // bottom:
                                    //     BorderSide(color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Progaram 2',
                                    style: TextStyle(
                                        fontSize: 14, fontFamily: "Nunito"),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 75,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 1),
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Progaram 3',
                                    style: TextStyle(
                                        fontSize: 14, fontFamily: "Nunito"),
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
                                      bottom: BorderSide(
                                          color: Colors.black, width: 1),
                                      right: BorderSide(
                                          color: Colors.black, width: 1),
                                      top: BorderSide(
                                          color: Colors.black, width: 1)),
                                ),
                                child: Center(
                                  child: Text(
                                    'Receipt\n   No',
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
                                height: 50,
                                width: 72,
                                decoration: BoxDecoration(
                                  border: Border(
                                    // bottom:
                                    //     BorderSide(color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '2016000042',
                                    style: TextStyle(
                                        fontSize: 11, fontFamily: "Nunito"),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 72,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    // bottom:
                                    //     BorderSide(color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '2016000042',
                                    style: TextStyle(
                                        fontSize: 11, fontFamily: "Nunito"),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 72,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 1),
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '2016000042',
                                    style: TextStyle(
                                        fontSize: 11, fontFamily: "Nunito"),
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
                                      bottom: BorderSide(
                                          color: Colors.black, width: 1),
                                      right: BorderSide(
                                          color: Colors.black, width: 1),
                                      top: BorderSide(
                                          color: Colors.black, width: 1)),
                                ),
                                child: Center(
                                  child: Text(
                                    'Amount',
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
                                height: 50,
                                width: 72,
                                decoration: BoxDecoration(
                                  border: Border(
                                    // bottom:
                                    //     BorderSide(color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '708',
                                    style: TextStyle(
                                        fontSize: 14, fontFamily: "Nunito"),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 72,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    // bottom:
                                    //     BorderSide(color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '708',
                                    style: TextStyle(
                                        fontSize: 14, fontFamily: "Nunito"),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 72,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 1),
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '708',
                                    style: TextStyle(
                                        fontSize: 14, fontFamily: "Nunito"),
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
                                      bottom: BorderSide(
                                          color: Colors.black, width: 1),
                                      right: BorderSide(
                                          color: Colors.black, width: 1),
                                      top: BorderSide(
                                          color: Colors.black, width: 1)),
                                ),
                                child: Center(
                                  child: Text(
                                    'Transaction\n        Id',
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
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    // bottom:
                                    //     BorderSide(color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '2016000042',
                                    style: TextStyle(
                                        fontSize: 13, fontFamily: "Nunito"),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    // bottom:
                                    //     BorderSide(color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '2016000042',
                                    style: TextStyle(
                                        fontSize: 13, fontFamily: "Nunito"),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 1),
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '2016000042',
                                    style: TextStyle(
                                        fontSize: 13, fontFamily: "Nunito"),
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
                                      bottom: BorderSide(
                                          color: Colors.black, width: 1),
                                      right: BorderSide(
                                          color: Colors.black, width: 1),
                                      top: BorderSide(
                                          color: Colors.black, width: 1)),
                                ),
                                child: Center(
                                  child: Text(
                                    'Transaction\n      Date',
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
                                height: 50,
                                width: 90,
                                decoration: BoxDecoration(
                                  border: Border(
                                    // bottom:
                                    //     BorderSide(color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '03/15/2022',
                                    style: TextStyle(
                                        fontSize: 14, fontFamily: "Nunito"),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 90,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    // bottom:
                                    //     BorderSide(color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '03/15/2022',
                                    style: TextStyle(
                                        fontSize: 14, fontFamily: "Nunito"),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 90,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 1),
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '03/15/2022',
                                    style: TextStyle(
                                        fontSize: 14, fontFamily: "Nunito"),
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
                                width: 70,
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black, width: 1),
                                      right: BorderSide(
                                          color: Colors.black, width: 1),
                                      top: BorderSide(
                                          color: Colors.black, width: 1)),
                                ),
                                child: Center(
                                  child: Text(
                                    'Print',
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
                                height: 50,
                                width: 70,
                                decoration: BoxDecoration(
                                  border: Border(
                                    // bottom:
                                    //     BorderSide(color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    print('working');

                                    await PdfApi.genaratePdf(
                                        'hello ', 'sample');
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
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 70,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    // bottom:
                                    //     BorderSide(color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    await PdfApi.genaratePdf(
                                        'hello ', 'sample');
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
                              ),
                              InkWell(
                                onTap: () async {
                                  await PdfApi.genaratePdf('hello ', 'sample');
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 0),
                                  height: 50,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black, width: 1),
                                      top: BorderSide(
                                          color: Colors.black, width: 1),
                                      right: BorderSide(
                                          color: Colors.black, width: 1),
                                      // left:
                                      //     BorderSide(color: Colors.black, width: 1)
                                    ),
                                  ),
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          'Showing 3 of 3 Entries',
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
                        width: 200,
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
              ),
            )),
          ),
        );
      }),
    );
  }
}

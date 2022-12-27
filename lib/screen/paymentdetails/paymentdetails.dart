import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/screen/member_details/member_controller.dart';
import 'package:hslr/screen/paymentdetails/payment_controller.dart';
import 'package:hslr/screen/paymentdetails/pdf_api.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart';

import '../dashboard/dashboard_controller.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({Key? key}) : super(key: key);

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  final pdf = pw.Document();
  MemberDetailsController mebController = Get.put(MemberDetailsController());
  // PaymentController paymentController = Get.put(PaymentController());
  final paymentController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    var data = paymentController.getpaymentList.value.userData1;
    print(data!.length.toString());

    return GetBuilder<DashboardController>(
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: _createDataTable(data),
                    ),
                  )
                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  //     child: Table(
                  //       border: TableBorder.all(color: Colors.black),
                  //       children: [
                  //         TableRow(children: [
                  //           Flexible(
                  //             child: Container(
                  //               // margin: EdgeInsets.only(top: 10),
                  //               height: 40,
                  //               width: 25,
                  //               child: Center(
                  //                 child: Text(
                  //                   'No',
                  //                   style: TextStyle(
                  //                       fontSize: 15,
                  //                       fontFamily: "Nunito",
                  //                       fontWeight: FontWeight.bold,
                  //                       color: Color(
                  //                           0xffDC3638) // Colors.blue.shade700,//
                  //                       ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //           Container(
                  //             // margin: EdgeInsets.only(top: 10),
                  //             height: 40,
                  //             width: 75,
                  //             // decoration: BoxDecoration(
                  //             //   border: Border(
                  //             //       bottom: BorderSide(
                  //             //           color: Colors.black, width: 1),
                  //             //       right: BorderSide(
                  //             //           color: Colors.black, width: 1),
                  //             //       top: BorderSide(
                  //             //           color: Colors.black, width: 1)),
                  //             // ),
                  //             child: Center(
                  //               child: Text(
                  //                 'Program\n  Name',
                  //                 style: TextStyle(
                  //                   fontSize: 15,
                  //                   fontFamily: "Nunito",
                  //                   fontWeight: FontWeight.bold,
                  //                   color: Color(0xffDC3638),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //           Container(
                  //             // margin: EdgeInsets.only(top: 10),
                  //             height: 40,
                  //             width: 72,
                  //             // decoration: BoxDecoration(
                  //             //   border: Border(
                  //             //       bottom: BorderSide(
                  //             //           color: Colors.black, width: 1),
                  //             //       right: BorderSide(
                  //             //           color: Colors.black, width: 1),
                  //             //       top: BorderSide(
                  //             //           color: Colors.black, width: 1)),
                  //             // ),
                  //             child: Center(
                  //               child: Text(
                  //                 'Receipt\n   No',
                  //                 style: TextStyle(
                  //                   fontSize: 14,
                  //                   fontFamily: "Nunito",
                  //                   fontWeight: FontWeight.bold,
                  //                   color: Color(0xffDC3638),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //           Container(
                  //             margin: EdgeInsets.only(top: 10),
                  //             height: 40,
                  //             width: 72,
                  //             // decoration: BoxDecoration(
                  //             //   border: Border(
                  //             //       bottom: BorderSide(
                  //             //           color: Colors.black, width: 1),
                  //             //       right: BorderSide(
                  //             //           color: Colors.black, width: 1),
                  //             //       top: BorderSide(
                  //             //           color: Colors.black, width: 1)),
                  //             // ),
                  //             child: Center(
                  //               child: Text(
                  //                 'Amount',
                  //                 style: TextStyle(
                  //                     fontWeight: FontWeight.bold,
                  //                     fontSize: 15,
                  //                     fontFamily: "Nunito",
                  //                     color: Color(
                  //                       0xffDC3638,
                  //                     )),
                  //               ),
                  //             ),
                  //           ),
                  //           Container(
                  //             margin: EdgeInsets.only(top: 10),
                  //             height: 40,
                  //             width: 80,
                  //             // decoration: BoxDecoration(
                  //             //   border: Border(
                  //             //       bottom: BorderSide(
                  //             //           color: Colors.black, width: 1),
                  //             //       right: BorderSide(
                  //             //           color: Colors.black, width: 1),
                  //             //       top: BorderSide(
                  //             //           color: Colors.black, width: 1)),
                  //             // ),
                  //             child: Center(
                  //               child: Text(
                  //                 'Transaction Id',
                  //                 style: TextStyle(
                  //                     fontWeight: FontWeight.bold,
                  //                     fontFamily: "Nunito",
                  //                     fontSize: 14,
                  //                     color: Color(
                  //                       0xffDC3638,
                  //                     )),
                  //               ),
                  //             ),
                  //           ),
                  //           Container(
                  //             margin: EdgeInsets.only(top: 10),
                  //             height: 40,
                  //             width: 90,
                  //             // decoration: BoxDecoration(
                  //             //   border: Border(
                  //             //       bottom: BorderSide(
                  //             //           color: Colors.black, width: 1),
                  //             //       right: BorderSide(
                  //             //           color: Colors.black, width: 1),
                  //             //       top: BorderSide(
                  //             //           color: Colors.black, width: 1)),
                  //             // ),
                  //             child: Center(
                  //               child: Text(
                  //                 'Transaction Date',
                  //                 style: TextStyle(
                  //                     fontWeight: FontWeight.bold,
                  //                     fontFamily: "Nunito",
                  //                     fontSize: 14,
                  //                     color: Color(
                  //                       0xffDC3638,
                  //                     )),
                  //               ),
                  //             ),
                  //           ),
                  //         ]),
                  //         TableRow(children: [
                  //           Text('Row 1'),
                  //           Text('Row 1'),
                  //           Text('Row 1'),
                  //           Text('Row 2'),
                  //           Text('Row 2'),
                  //           Text('Row 2'),
                  //         ]),
                  //         TableRow(children: [
                  //           Text('Row 2'),
                  //           Text('Row 2'),
                  //           Text('Row 2'),
                  //           Text('Row 2'),
                  //           Text('Row 2'),
                  //           Text('Row 2'),
                  //         ]),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  // Padding(
                  //   padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  //   child: SingleChildScrollView(
                  //     scrollDirection: Axis.horizontal,
                  //     child: Row(
                  //       children: [
                  //         Column(
                  //           // crossAxisAlignment: CrossAxisAlignment.start,

                  //           children: [
                  //             // for (int i = 0; i < 2; i++)
                  //             Container(
                  //               margin: EdgeInsets.only(top: 10),
                  //               height: 40,
                  //               width: 25,
                  //               decoration: BoxDecoration(
                  //                 border: Border.all(
                  //                   color: Colors.black,
                  //                   width: 1,
                  //                 ),
                  //               ),
                  //               child: Center(
                  //                 child: Text(
                  //                   'No',
                  //                   style: TextStyle(
                  //                       fontSize: 15,
                  //                       fontFamily: "Nunito",
                  //                       fontWeight: FontWeight.bold,
                  //                       color: Color(
                  //                           0xffDC3638) // Colors.blue.shade700,//
                  //                       ),
                  //                 ),
                  //               ),
                  //             ),
                  //             SizedBox.expand(
                  //               child: Column(
                  //                 children: [
                  //                   // for (int i = 0; i < 2; i++)

                  //                   ListView.builder(
                  //                     shrinkWrap: true,
                  //                     scrollDirection: Axis.horizontal,
                  //                     itemCount: 3,
                  //                     itemBuilder: (context, index) {
                  //                       return Container(
                  //                         margin: EdgeInsets.only(top: 0),
                  //                         height: 50,
                  //                         width: 25,
                  //                         decoration: BoxDecoration(
                  //                           border: Border(
                  //                               right: BorderSide(
                  //                                   color: Colors.black,
                  //                                   width: 1),
                  //                               left: BorderSide(
                  //                                   color: Colors.black,
                  //                                   width: 1)),
                  //                         ),
                  //                         child: Center(
                  //                           child: Text(
                  //                             '1',
                  //                             style: TextStyle(
                  //                               fontSize: 14,
                  //                               fontFamily: "Nunito",
                  //                             ),
                  //                           ),
                  //                         ),
                  //                       );
                  //                     },
                  //                   ),

                  //                   // Container(
                  //                   //   margin: EdgeInsets.only(top: 0),
                  //                   //   height: 50,
                  //                   //   width: 25,
                  //                   //   decoration: BoxDecoration(
                  //                   //     border: Border(
                  //                   //         // bottom:
                  //                   //         //     BorderSide(color: Colors.black, width: 1),
                  //                   //         right: BorderSide(
                  //                   //             color: Colors.black, width: 1),
                  //                   //         left: BorderSide(
                  //                   //             color: Colors.black, width: 1)),
                  //                   //   ),
                  //                   //   child: Center(
                  //                   //     child: Text(
                  //                   //       '1',
                  //                   //       style: TextStyle(
                  //                   //         fontSize: 14,
                  //                   //         fontFamily: "Nunito",
                  //                   //       ),
                  //                   //     ),
                  //                   //   ),
                  //                   // ),
                  //                   // Container(
                  //                   //   margin: EdgeInsets.only(top: 0),
                  //                   //   height: 50,
                  //                   //   width: 25,
                  //                   //   decoration: BoxDecoration(
                  //                   //     border: Border(
                  //                   //         top: BorderSide(
                  //                   //             color: Colors.black, width: 1),
                  //                   //         // bottom:
                  //                   //         //     BorderSide(color: Colors.black, width: 1),
                  //                   //         right: BorderSide(
                  //                   //             color: Colors.black, width: 1),
                  //                   //         left: BorderSide(
                  //                   //             color: Colors.black, width: 1)),
                  //                   //   ),
                  //                   //   child: Center(
                  //                   //     child: Text(
                  //                   //       '2',
                  //                   //       style: TextStyle(
                  //                   //           fontSize: 14,
                  //                   //           fontFamily: "Nunito"),
                  //                   //     ),
                  //                   //   ),
                  //                   // ),
                  //                   // Container(
                  //                   //   margin: EdgeInsets.only(top: 0),
                  //                   //   height: 50,
                  //                   //   width: 25,
                  //                   //   decoration: BoxDecoration(
                  //                   //     border: Border(
                  //                   //         bottom: BorderSide(
                  //                   //             color: Colors.black, width: 1),
                  //                   //         top: BorderSide(
                  //                   //             color: Colors.black, width: 1),
                  //                   //         right: BorderSide(
                  //                   //             color: Colors.black, width: 1),
                  //                   //         left: BorderSide(
                  //                   //             color: Colors.black, width: 1)),
                  //                   //   ),
                  //                   //   child: Center(
                  //                   //     child: Text(
                  //                   //       '3',
                  //                   //       style: TextStyle(
                  //                   //           fontSize: 14,
                  //                   //           fontFamily: "Nunito"),
                  //                   //     ),
                  //                   //   ),
                  //                   // ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         Column(
                  //           // mainAxisAlignment: MainAxisAlignment.start,
                  //           // crossAxisAlignment: cros,
                  //           children: [
                  //             Container(
                  //               margin: EdgeInsets.only(top: 10),
                  //               height: 40,
                  //               width: 75,
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
                  //                   'Program\n  Name',
                  //                   style: TextStyle(
                  //                     fontSize: 15,
                  //                     fontFamily: "Nunito",
                  //                     fontWeight: FontWeight.bold,
                  //                     color: Color(0xffDC3638),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //             Container(
                  //               margin: EdgeInsets.only(top: 0),
                  //               height: 50,
                  //               width: 75,
                  //               decoration: BoxDecoration(
                  //                 border: Border(
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
                  //                   'Progaram 1',
                  //                   style: TextStyle(
                  //                       fontSize: 14, fontFamily: "Nunito"),
                  //                 ),
                  //               ),
                  //             ),
                  //             Container(
                  //               margin: EdgeInsets.only(top: 0),
                  //               height: 50,
                  //               width: 75,
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
                  //                   'Progaram 2',
                  //                   style: TextStyle(
                  //                       fontSize: 14, fontFamily: "Nunito"),
                  //                 ),
                  //               ),
                  //             ),
                  //             Container(
                  //               margin: EdgeInsets.only(top: 0),
                  //               height: 50,
                  //               width: 75,
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
                  //                   'Progaram 3',
                  //                   style: TextStyle(
                  //                       fontSize: 14, fontFamily: "Nunito"),
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         Column(
                  //           children: [
                  //             Container(
                  //               margin: EdgeInsets.only(top: 10),
                  //               height: 40,
                  //               width: 72,
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
                  //                   'Receipt\n   No',
                  //                   style: TextStyle(
                  //                     fontSize: 14,
                  //                     fontFamily: "Nunito",
                  //                     fontWeight: FontWeight.bold,
                  //                     color: Color(0xffDC3638),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //             Container(
                  //               margin: EdgeInsets.only(top: 0),
                  //               height: 50,
                  //               width: 72,
                  //               decoration: BoxDecoration(
                  //                 border: Border(
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
                  //                   '2016000042',
                  //                   style: TextStyle(
                  //                       fontSize: 11, fontFamily: "Nunito"),
                  //                 ),
                  //               ),
                  //             ),
                  //             Container(
                  //               margin: EdgeInsets.only(top: 0),
                  //               height: 50,
                  //               width: 72,
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
                  //                   '2016000042',
                  //                   style: TextStyle(
                  //                       fontSize: 11, fontFamily: "Nunito"),
                  //                 ),
                  //               ),
                  //             ),
                  //             Container(
                  //               margin: EdgeInsets.only(top: 0),
                  //               height: 50,
                  //               width: 72,
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
                  //                   '2016000042',
                  //                   style: TextStyle(
                  //                       fontSize: 11, fontFamily: "Nunito"),
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         Column(
                  //           children: [
                  //             Container(
                  //               margin: EdgeInsets.only(top: 10),
                  //               height: 40,
                  //               width: 72,
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
                  //                   'Amount',
                  //                   style: TextStyle(
                  //                       fontWeight: FontWeight.bold,
                  //                       fontSize: 15,
                  //                       fontFamily: "Nunito",
                  //                       color: Color(
                  //                         0xffDC3638,
                  //                       )),
                  //                 ),
                  //               ),
                  //             ),
                  //             Container(
                  //               margin: EdgeInsets.only(top: 0),
                  //               height: 50,
                  //               width: 72,
                  //               decoration: BoxDecoration(
                  //                 border: Border(
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
                  //                   '708',
                  //                   style: TextStyle(
                  //                       fontSize: 14, fontFamily: "Nunito"),
                  //                 ),
                  //               ),
                  //             ),
                  //             Container(
                  //               margin: EdgeInsets.only(top: 0),
                  //               height: 50,
                  //               width: 72,
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
                  //                   '708',
                  //                   style: TextStyle(
                  //                       fontSize: 14, fontFamily: "Nunito"),
                  //                 ),
                  //               ),
                  //             ),
                  //             Container(
                  //               margin: EdgeInsets.only(top: 0),
                  //               height: 50,
                  //               width: 72,
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
                  //                   '708',
                  //                   style: TextStyle(
                  //                       fontSize: 14, fontFamily: "Nunito"),
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         Column(
                  //           children: [
                  //             Container(
                  //               margin: EdgeInsets.only(top: 10),
                  //               height: 40,
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
                  //                   'Transaction\n        Id',
                  //                   style: TextStyle(
                  //                       fontWeight: FontWeight.bold,
                  //                       fontFamily: "Nunito",
                  //                       fontSize: 14,
                  //                       color: Color(
                  //                         0xffDC3638,
                  //                       )),
                  //                 ),
                  //               ),
                  //             ),
                  //             Container(
                  //               margin: EdgeInsets.only(top: 0),
                  //               height: 50,
                  //               width: 80,
                  //               decoration: BoxDecoration(
                  //                 border: Border(
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
                  //                   '2016000042',
                  //                   style: TextStyle(
                  //                       fontSize: 13, fontFamily: "Nunito"),
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
                  //                   '2016000042',
                  //                   style: TextStyle(
                  //                       fontSize: 13, fontFamily: "Nunito"),
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
                  //                   '2016000042',
                  //                   style: TextStyle(
                  //                       fontSize: 13, fontFamily: "Nunito"),
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         Column(
                  //           children: [
                  //             Container(
                  //               margin: EdgeInsets.only(top: 10),
                  //               height: 40,
                  //               width: 90,
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
                  //                   'Transaction\n      Date',
                  //                   style: TextStyle(
                  //                       fontWeight: FontWeight.bold,
                  //                       fontFamily: "Nunito",
                  //                       fontSize: 14,
                  //                       color: Color(
                  //                         0xffDC3638,
                  //                       )),
                  //                 ),
                  //               ),
                  //             ),
                  //             Container(
                  //               margin: EdgeInsets.only(top: 0),
                  //               height: 50,
                  //               width: 90,
                  //               decoration: BoxDecoration(
                  //                 border: Border(
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
                  //                   '03/15/2022',
                  //                   style: TextStyle(
                  //                       fontSize: 14, fontFamily: "Nunito"),
                  //                 ),
                  //               ),
                  //             ),
                  //             Container(
                  //               margin: EdgeInsets.only(top: 0),
                  //               height: 50,
                  //               width: 90,
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
                  //                   '03/15/2022',
                  //                   style: TextStyle(
                  //                       fontSize: 14, fontFamily: "Nunito"),
                  //                 ),
                  //               ),
                  //             ),
                  //             Container(
                  //               margin: EdgeInsets.only(top: 0),
                  //               height: 50,
                  //               width: 90,
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
                  //                   '03/15/2022',
                  //                   style: TextStyle(
                  //                       fontSize: 14, fontFamily: "Nunito"),
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         Column(
                  //           children: [
                  //             Container(
                  //               margin: EdgeInsets.only(top: 10),
                  //               height: 40,
                  //               width: 70,
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
                  //                   'Print',
                  //                   style: TextStyle(
                  //                       fontWeight: FontWeight.bold,
                  //                       fontFamily: "Nunito",
                  //                       fontSize: 14,
                  //                       color: Color(
                  //                         0xffDC3638,
                  //                       )),
                  //                 ),
                  //               ),
                  //             ),
                  //             Container(
                  //               margin: EdgeInsets.only(top: 0),
                  //               height: 50,
                  //               width: 70,
                  //               decoration: BoxDecoration(
                  //                 border: Border(
                  //                   // bottom:
                  //                   //     BorderSide(color: Colors.black, width: 1),
                  //                   right: BorderSide(
                  //                       color: Colors.black, width: 1),
                  //                   // left:
                  //                   //     BorderSide(color: Colors.black, width: 1)
                  //                 ),
                  //               ),
                  //               child: InkWell(
                  //                 onTap: () async {
                  //                   print('working');

                  //                   await PdfApi.genaratePdf(
                  //                       'hello ', 'sample');
                  //                 },
                  //                 child: Center(
                  //                   child: Padding(
                  //                     padding: const EdgeInsets.only(left: 8.0),
                  //                     child: Image.asset(
                  //                       'assets/hj.png',
                  //                       height: 25,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //             Container(
                  //               margin: EdgeInsets.only(top: 0),
                  //               height: 50,
                  //               width: 70,
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
                  //               child: InkWell(
                  //                 onTap: () async {
                  //                   await PdfApi.genaratePdf(
                  //                       'hello ', 'sample');
                  //                 },
                  //                 child: Center(
                  //                   child: Padding(
                  //                     padding: const EdgeInsets.only(left: 8.0),
                  //                     child: Image.asset(
                  //                       'assets/hj.png',
                  //                       height: 25,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //             InkWell(
                  //               onTap: () async {
                  //                 await PdfApi.genaratePdf('hello ', 'sample');
                  //               },
                  //               child: Container(
                  //                 margin: EdgeInsets.only(top: 0),
                  //                 height: 50,
                  //                 width: 70,
                  //                 decoration: BoxDecoration(
                  //                   border: Border(
                  //                     bottom: BorderSide(
                  //                         color: Colors.black, width: 1),
                  //                     top: BorderSide(
                  //                         color: Colors.black, width: 1),
                  //                     right: BorderSide(
                  //                         color: Colors.black, width: 1),
                  //                     // left:
                  //                     //     BorderSide(color: Colors.black, width: 1)
                  //                   ),
                  //                 ),
                  //                 child: Center(
                  //                   child: Padding(
                  //                     padding: const EdgeInsets.only(left: 8.0),
                  //                     child: Image.asset(
                  //                       'assets/hj.png',
                  //                       height: 25,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ],

                  //       // textDirection: Axis.horizontal,

                  //       // children: [
                  //       //   buildRow([
                  //       //     'Cell 1',
                  //       //     'Cell 2',
                  //       //     'Cell 3',
                  //       //     'Cell 4',
                  //       //     'Cell 5',
                  //       //   ]),
                  //       // ],
                  //     ),
                  //   ),
                  // ),
                  ,
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
              ),
            )),
          ),
        );
      }),
    );
  }

  DataTable _createDataTable(data) {
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
      // dividerThickness: 1,
      columns: _createColumns(),
      dataTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: "Nunito",
          fontSize: 14,
          color: Colors.black),
      rows: List<DataRow>.generate(
          data.length,
          (index) => DataRow(cells: [
                DataCell(Text(
                  (index + 1).toString(),
                )),
                DataCell(Center(child: Text(data[index].videoName.toString()))),
                DataCell(
                    Center(child: Text(data[index].receiptNumber.toString()))),
                DataCell(Center(child: Text(data[index].amount.toString()))),
                DataCell(
                    Center(child: Text(data[index].receiptNumber.toString()))),
                DataCell(Center(child: Text(data[index].date.toString()))),
                DataCell(
                  InkWell(
                    onTap: () {
                      Get.defaultDialog(
                        middleTextStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Nunito",
                            fontSize: 16,
                            color: Colors.black),
                        titleStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Nunito",
                            fontSize: 18,
                            color: Colors.black),
                        title: 'Download PDF',
                        middleText:
                            'Do you want to download the payment details as PDF?',
                        actions: [
                          ElevatedButton(
                            onPressed: () async {
                             await openPdf(
                                url:
                                    'https://www.emed.co.in//Admin//Recp_PDFWriter.aspx?QRecpNo=2019000042000',
                                fileName: 'exmp.pdf',
                              );
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
                        ],
                      );
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
              ])),
      // data
      //     .map((datas) => DataRow(cells: [
      //           DataCell(Text('1')),
      //           DataCell(Text(datas.videoName.toString())),
      //           DataCell(Text(datas.receiptNumber.toString())),
      //           DataCell(Text(datas.amount.toString())),
      //           DataCell(Text(datas.receiptNumber.toString())),
      //           DataCell(Text('print'))
      //         ]))
      //     .toList(),
      // decoration:
      //     BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
    );
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
      DataColumn(
        label: Center(
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
      DataColumn(
        label: Center(
          child: Text(
            'Transaction Id',
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
      DataColumn(
        label: Center(
          child: Text(
            'Transaction Date',
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
      DataColumn(
        label: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 40),
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
      )
    ];
  }

  Future openPdf({required String url, required String fileName}) async {
    print(url.toString());
    final file = await downloadPdf(url, fileName);
    print(url.toString());

    if (file == null) return null;
    print('Path:${file.path}');
    OpenFile.open(file.path);
  }

  Future<File?> downloadPdf(String url, String name) async {
    final dio = Dio();
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');
    print(file.toString());

    try {
      final response = await dio.get(url,
          options: Options(
              followRedirects: false, responseType: ResponseType.bytes));
      print(response.data);

      final ref = file.openSync(mode: FileMode.write);
      ref.writeFromSync(response.data);
      await ref.close;
      return file;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // List<DataRow> _createRows(datas) {
  //   return datas
  //       .map((data) => DataRow(cells: [
  //             DataCell(Text(data.length + 1)),
  //             DataCell(Text(data.videoName.toString())),
  //             DataCell(Text(data.receiptNumber.toString())),
  //             DataCell(Text(data.amount.toString())),
  //             DataCell(Text(data.receiptNumber.toString())),
  //             DataCell(Text('print'))
  //           ]))
  //       .toList();

  // }
}

// class reciptData extends DataTableSource {
//   final paymentController = Get.find<PaymentController>();

//   var data =
//       paymentController.getpaymentList.value.userData1;

//   @override
//   DataRow? getRow(int index) {
//     return DataRow(cells: [DataCell(Text('hi'))]);
//   }

//   @override
//   // TODO: implement isRowCountApproximate
//   bool get isRowCountApproximate => throw UnimplementedError();

//   @override
//   // TODO: implement rowCount
//   int get rowCount => throw UnimplementedError();

//   @override
//   // TODO: implement selectedRowCount
//   int get selectedRowCount => throw UnimplementedError();
// }

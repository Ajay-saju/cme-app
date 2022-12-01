import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReceiptScreen extends StatelessWidget {
  ReceiptScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final columns = ['SL\nNO', 'Progamme\nName', 'Date Taken', 'Amount'];
    // final row = ['1', 'phycology', '11/05/2022', '55,000 Rs'];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
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
                      const SizedBox(
                        width: 25,
                      ),
                      const Text(
                        "PG NEET/CET RESULT",
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
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 29),
              child: Text(
                'Receipts',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w900,
                    color: Color(0xffDC3638)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: DataTable(
                    columnSpacing: 25,
                    dataTextStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: "Nunito",
                    ),
                    headingTextStyle: const TextStyle(
                        fontSize: 15,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.bold,
                        color: Color(0xffDC3638)),
                    border: TableBorder.all(),
                    columns: getColumn(columns),
                    rows: rows),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<DataColumn> getColumn(List<String> columns) {  
    return columns
        .map((String colum) => DataColumn(
                label: Container(
                    child: Text(
              colum,
              textAlign: TextAlign.left,
            ))))
        .toList();
  }

  List<DataRow> rows = [
    DataRow(
      cells: [
        DataCell(Center(child: Text('1'))),
        DataCell(Text('Phycology')),
        DataCell(Text('11/09/1994')),
        DataCell(Text('70')),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Center(child: Text('1'))),
        DataCell(Text('Phycology')),
        DataCell(Text('11/09/1994')),
        DataCell(Text('70')),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Center(child: Text('1'))),
        DataCell(Text('Phycology')),
        DataCell(Text('11/09/1994')),
        DataCell(Text('70')),
      ],
    ),
  ];

  // List<DataRow> getRows(List<String> rows) {
  //   return rows.map((String row) => DataRow(cells: Text(row))).toList();
  // }
}

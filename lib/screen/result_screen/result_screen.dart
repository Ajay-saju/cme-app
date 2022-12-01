import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final columns = [
      'NO',
      'Programm\nName',
      'Date',
      'Marks',
      'Time',
      'Total',
      'Rank'
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
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
            padding: EdgeInsets.only(left: 25),
            child: Text(
              'Results',
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w900,
                  color: Color(0xffDC3638)),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 15),
          //   child: SingleChildScrollView(
          //     // scrollDirection: Axis.horizontal,
          //     child: SingleChildScrollView(
          //       // scrollDirection: Axis.horizontal,
          //       child: Table(
          //         // defaultColumnWidth: FlexColumnWidth(),
          //         columnWidths: const <int, TableColumnWidth>{
          //           0: FlexColumnWidth(),
          //           1: FixedColumnWidth(64),
          //           2: FixedColumnWidth(64),
          //           3: IntrinsicColumnWidth(),
          //           4: IntrinsicColumnWidth(),
          //         },
          //         defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          //         border: TableBorder.all(
          //             color: Colors.black, width: 1, style: BorderStyle.solid),
          //         children:
          //             List<TableRow>.generate(tableContent.length, (index) {
          //           // final result = tableContent[index];
          //           return tableContent[index];
          //         }),
          //       ),
          //     ),
          //   ),
          // ),
          // // Expanded(
          //   child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       shrinkWrap: true,
          //       itemCount: 100,
          //       itemBuilder: (context, index) => CircleAvatar(
          //             radius: 10,
          //             backgroundColor: Colors.black,
          //           )),
          // ),
          SingleChildScrollView(
              // scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: DataTable(
                    columnSpacing: 4,
                    
                    dataTextStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: "Nunito",
                    ),
                    headingTextStyle: const TextStyle(
                        fontSize: 14,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.bold,
                        color: Color(0xffDC3638)),
                    border: TableBorder.all(),
                    columns: getColumn(columns),
                    rows: result),
              ))
        ],
      )),
    );
  }

  List<DataRow> result = [
    const DataRow(
      cells: [
        DataCell(Center(child: Text('1'))),
        DataCell(Text('Phycology')),
        DataCell(Text('11/09/1994')),
        DataCell(Text('70')),
        DataCell(Text('2hrs')),
        DataCell(Text(
          '15',
          textAlign: TextAlign.center,
        )),
        DataCell(Text('8')),
      ],
    ),
    const DataRow(
      cells: [
        DataCell(Center(child: Text('1'))),
        DataCell(Text('Phycology')),
        DataCell(Text('11/09/1994')),
        DataCell(Text('70')),
        DataCell(Text('2hrs')),
        DataCell(Text(
          '15',
          textAlign: TextAlign.center,
        )),
        DataCell(Text('8')),
      ],
    ),
    const DataRow(
      cells: [
        DataCell(Center(child: Text('1'))),
        DataCell(Text('Phycology')),
        DataCell(Text('11/09/1994')),
        DataCell(Text('70')),
        DataCell(Text('2hrs')),
        DataCell(Text(
          '15',
          textAlign: TextAlign.center,
        )),
        DataCell(Text('8')),
      ],
    ),
  ];

  // List<TableRow> tableContent = [
  //   const TableRow(
  //     children: <Widget>[
  //       TableCell(
  //         // verticalAlignment: TableCellVerticalAlignment.middle,
  //         child: Text(
  //           'SL\nNo',
  //           style: TextStyle(
  //               fontSize: 15,
  //               fontFamily: "Nunito",
  //               fontWeight: FontWeight.bold,
  //               color: Color(0xffDC3638)),
  //           textAlign: TextAlign.center,
  //         ),
  //       ),
  //       TableCell(
  //         verticalAlignment: TableCellVerticalAlignment.middle,
  //         child: Text(
  //           'Programm Name',
  //           style: TextStyle(
  //               fontSize: 15,
  //               fontFamily: "Nunito",
  //               fontWeight: FontWeight.bold,
  //               color: Color(0xffDC3638)),
  //           textAlign: TextAlign.center,
  //         ),
  //       ),
  //       TableCell(
  //         verticalAlignment: TableCellVerticalAlignment.middle,
  //         child: Text(
  //           'Date Taken',
  //           style: TextStyle(
  //               fontSize: 15,
  //               fontFamily: "Nunito",
  //               fontWeight: FontWeight.bold,
  //               color: Color(0xffDC3638)),
  //           textAlign: TextAlign.center,
  //         ),
  //       ),
  //       TableCell(
  //         verticalAlignment: TableCellVerticalAlignment.middle,
  //         child: Text(
  //           'Marks',
  //           style: TextStyle(
  //               fontSize: 15,
  //               fontFamily: "Nunito",
  //               fontWeight: FontWeight.bold,
  //               color: Color(0xffDC3638)),
  //           textAlign: TextAlign.center,
  //         ),
  //       ),
  //       TableCell(
  //         verticalAlignment: TableCellVerticalAlignment.middle,
  //         child: Text(
  //           'Time Tak',
  //           style: TextStyle(
  //               fontSize: 15,
  //               fontFamily: "Nunito",
  //               fontWeight: FontWeight.bold,
  //               color: Color(0xffDC3638)),
  //           textAlign: TextAlign.center,
  //         ),
  //       ),
  //       TableCell(
  //         verticalAlignment: TableCellVerticalAlignment.middle,
  //         child: Text(
  //           'Total People Attended',
  //           style: TextStyle(
  //               fontSize: 15,
  //               fontFamily: "Nunito",
  //               fontWeight: FontWeight.bold,
  //               color: Color(0xffDC3638)),
  //           textAlign: TextAlign.center,
  //         ),
  //       ),
  //       TableCell(
  //         verticalAlignment: TableCellVerticalAlignment.middle,
  //         child: Text(
  //           'Rank',
  //           style: TextStyle(
  //               fontSize: 15,
  //               fontFamily: "Nunito",
  //               fontWeight: FontWeight.bold,
  //               color: Color(0xffDC3638)),
  //           textAlign: TextAlign.center,
  //         ),
  //       ),
  //     ],
  //   ),
  //   const TableRow(
  //     children: <Widget>[
  //       // TableCell(
  //       //   // verticalAlignment: TableCellVerticalAlignment.middle,
  //       //   child: Text(
  //       //     'SL\nNo',
  //       //     style: TextStyle(
  //       //         fontSize: 15,
  //       //         fontFamily: "Nunito",
  //       //         fontWeight: FontWeight.bold,
  //       //         color: Color(0xffDC3638)),
  //       //     textAlign: TextAlign.center,
  //       //   ),
  //       // ),
  //       // TableCell(
  //       //   verticalAlignment: TableCellVerticalAlignment.middle,
  //       //   child: Text(
  //       //     'Programm Name',
  //       //     style: TextStyle(
  //       //         fontSize: 15,
  //       //         fontFamily: "Nunito",
  //       //         fontWeight: FontWeight.bold,
  //       //         color: Color(0xffDC3638)),
  //       //     textAlign: TextAlign.center,
  //       //   ),
  //       // ),
  //       // TableCell(
  //       //   verticalAlignment: TableCellVerticalAlignment.middle,
  //       //   child: Text(
  //       //     'Date Taken',
  //       //     style: TextStyle(
  //       //         fontSize: 15,
  //       //         fontFamily: "Nunito",
  //       //         fontWeight: FontWeight.bold,
  //       //         color: Color(0xffDC3638)),
  //       //     textAlign: TextAlign.center,
  //       //   ),
  //       // ),
  //       // TableCell(
  //       //   verticalAlignment: TableCellVerticalAlignment.middle,
  //       //   child: Text(
  //       //     'Marks',
  //       //     style: TextStyle(
  //       //         fontSize: 15,
  //       //         fontFamily: "Nunito",
  //       //         fontWeight: FontWeight.bold,
  //       //         color: Color(0xffDC3638)),
  //       //     textAlign: TextAlign.center,
  //       //   ),
  //       // ),
  //       // TableCell(
  //       //   verticalAlignment: TableCellVerticalAlignment.middle,
  //       //   child: Text(
  //       //     'Time Tak',
  //       //     style: TextStyle(
  //       //         fontSize: 15,
  //       //         fontFamily: "Nunito",
  //       //         fontWeight: FontWeight.bold,
  //       //         color: Color(0xffDC3638)),
  //       //     textAlign: TextAlign.center,
  //       //   ),
  //       // ),
  //       // TableCell(
  //       //   verticalAlignment: TableCellVerticalAlignment.middle,
  //       //   child: Text(
  //       //     'Total People Attended',
  //       //     style: TextStyle(
  //       //         fontSize: 15,
  //       //         fontFamily: "Nunito",
  //       //         fontWeight: FontWeight.bold,
  //       //         color: Color(0xffDC3638)),
  //       //     textAlign: TextAlign.center,
  //       //   ),
  //       // ),
  //       // TableCell(
  //       //   verticalAlignment: TableCellVerticalAlignment.middle,
  //       //   child: Text(
  //       //     'Rank',
  //       //     style: TextStyle(
  //       //         fontSize: 15,
  //       //         fontFamily: "Nunito",
  //       //         fontWeight: FontWeight.bold,
  //       //         color: Color(0xffDC3638)),
  //       //     textAlign: TextAlign.center,
  //       //   ),   
  //       // ),
  //     ],
  //   ),
  // ];

  List<DataColumn> getColumn(List<String> columns) {
    return columns
        .map((String column) => DataColumn(
              label: Text(column,textAlign: TextAlign.center,),
            ))
        .toList();
  }
}

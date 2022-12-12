import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io' as io;

class PdfApi {
  static Future<void> genaratePdf(String test, String filename) async {
    final pdf = pw.Document();
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
              // mainAxisAlignment:pw. MainAxisAlignment.center,
              children: [
                pw.SizedBox(height: 25),
                pw.Padding(
                    padding: pw.EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: pw.Column(children: [
                      pw.Container(
                          constraints:
                              pw.BoxConstraints(maxWidth: double.infinity),
                          height: 150.0,
                          // width: double.infinity,
                          color: PdfColor(
                            0,
                            0.1,
                            0.2,
                          ),
                          child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              children: [
                                pw.SizedBox(height: 20),
                                pw.Text('V Works Software Pvt Ltd.',
                                    style: pw.TextStyle(
                                      fontSize: 25,
                                      color: PdfColor.fromRYB(0.1, 0.1, 0.1),
                                    )),
                                pw.SizedBox(height: 10),
                                pw.Text(
                                    "  Opposite to KSNC, 'A' Street 6th Cross A.R. Extension,    ",
                                    style: pw.TextStyle(
                                      fontSize: 18,
                                      color: PdfColor.fromRYB(0.1, 0.1, 0.1),
                                    )),
                                pw.Text("near Movieland Theatre, Gandhinagar,",
                                    style: pw.TextStyle(
                                      fontSize: 18,
                                      color: PdfColor.fromRYB(0.1, 0.1, 0.1),
                                    )),
                                pw.Text(" Bangalore - 560009.",
                                    style: pw.TextStyle(
                                      fontSize: 18,
                                      color: PdfColor.fromRYB(0.1, 0.1, 0.1),
                                    ))
                              ])),
                      pw.SizedBox(height: 20),
                      pw.Text("Receipt",
                          style: pw.TextStyle(
                            fontSize: 22,
                            color: PdfColor.fromRYB(0.7, 0.7, 0.7),
                          )),
                      pw.SizedBox(height: 30),
                      pw.Container(
                        child: pw.Row(
                          mainAxisAlignment:pw. MainAxisAlignment.spaceBetween,
                          children: [
                          // pw.SizedBox(width: 50),
                          pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text('Receipt Number :',
                                    style: pw.TextStyle(
                                      fontSize: 16,
                                    )),
                                pw.SizedBox(height: 10),

                                pw.Text('Receipt Date  :',
                                    style: pw.TextStyle(
                                      fontSize: 16,
                                    )),
                                //  pw.SizedBox(width: 50),

                                pw.SizedBox(height: 10),
                                pw.Text('Video Name :',
                                    style: pw.TextStyle(
                                      fontSize: 16,
                                    )),
                                pw.SizedBox(height: 10),
                                pw.Text('Practitioner Name :',
                                    style: pw.TextStyle(
                                      fontSize: 16,
                                    )),
                                pw.SizedBox(height: 10),
                                pw.Text('KMC Registration Number :',
                                    style: pw.TextStyle(
                                      fontSize: 16,
                                    )),
                                pw.SizedBox(height: 10),
                                pw.Text('Amount in Rs :',
                                    style: pw.TextStyle(
                                      fontSize: 16,
                                    )),
                                pw.SizedBox(height: 10),
                                pw.Text('Amount in Words :',
                                    style: pw.TextStyle(
                                      fontSize: 16,
                                    )),
                                pw.SizedBox(height: 10),
                                pw.Text('Towards :',
                                    style: pw.TextStyle(
                                      fontSize: 16,
                                    )),
                              ]),
                          pw.SizedBox(width: 70),
                          pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              // mainAxisAlignment: pw.MainAxisAlignment.,
                              children: [
                                pw.Text('2016000042',
                                    style: pw.TextStyle(
                                      fontSize: 16,
                                    )),
                                pw.SizedBox(height: 10),
                                pw.Text('03/15/2022',
                                    style: pw.TextStyle(
                                      fontSize: 16,
                                    )),
                                pw.SizedBox(height: 10),
                                pw.Text('Evidence Based Medicines',
                                    style: pw.TextStyle(
                                      fontSize: 16,
                                    )),
                                pw.SizedBox(height: 10),
                                pw.Text('Rakshitha',
                                    style: pw.TextStyle(
                                      fontSize: 16,
                                    )),
                                pw.SizedBox(height: 10),
                                pw.Text('1605',
                                    style: pw.TextStyle(
                                      fontSize: 16,
                                    )),
                                pw.SizedBox(height: 10),
                                pw.Text('708',
                                    style: pw.TextStyle(
                                      fontSize: 16,
                                    )),
                                pw.SizedBox(height: 10),
                                pw.Text('Seven Hundred Eight Only',
                                    style: pw.TextStyle(
                                      fontSize: 16,
                                    )),
                                pw.SizedBox(height: 10),
                                pw.Text(
                                    'Payment Todwards the Video\nEvidence Based Medicines',
                                    style: pw.TextStyle(
                                      fontSize: 16,
                                    )),
                                    pw.SizedBox(height: 20),
                                    pw.Text('                    Authorised Signature')
                              ]),
                        ]),
                      ),
                    ])),
              ]); // Center
        }));
    final outPut = await getTemporaryDirectory();
    var filePath = '${outPut.path}/filename.pdf';

    final files = await io.File(filePath).writeAsBytes(await pdf.save());

    await OpenFile.open(files.path);
  }
}

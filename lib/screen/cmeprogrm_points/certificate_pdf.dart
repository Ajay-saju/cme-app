import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io' as io;

import 'package:printing/printing.dart';

class CertificatePdf {
  static Future<void> createPdf() async {
    final firstImage =
        (await rootBundle.load('assets/mcouncil.jfif')).buffer.asUint8List();
    final secondImage =
        (await rootBundle.load('assets/images.png')).buffer.asUint8List();
    final qrCode =
        (await rootBundle.load('assets/icon-256x256.png')).buffer.asUint8List();

    final userImage =
        (await rootBundle.load('assets/userImage.jfif')).buffer.asUint8List();

    final signature =
        (await rootBundle.load('assets/signature.png')).buffer.asUint8List();

    var font = await PdfGoogleFonts.abhayaLibreRegular();

    final pdf = pw.Document();
    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Container(
            height: 600,
            width: 450,
            decoration: pw.BoxDecoration(
                border: pw.Border.all(
                    width: 2.5,
                    color: PdfColor(
                      0,
                      0.1,
                      0.2,
                    ))),
            child: pw.Padding(
                padding: pw.EdgeInsets.symmetric(horizontal: 15),
                child: pw.Column(children: [
                  pw.SizedBox(height: 35),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        pw.Image(pw.MemoryImage(firstImage),
                            width: 75, height: 75),
                        pw.Column(children: [
                          pw.Text('ONLINE CME\nCERTIFICATE',
                              style: pw.TextStyle(
                                  fontSize: 26,
                                  font: font,
                                  color: PdfColor(
                                    0.5,
                                    0.1,
                                    0.1,
                                  ),
                                  fontWeight: pw.FontWeight.bold)),
                          pw.Text('Karnataka Medical Council',
                              style: pw.TextStyle(fontSize: 15))
                        ]),
                        pw.Image(pw.MemoryImage(secondImage),
                            width: 75, height: 75)
                      ]),
                  pw.SizedBox(height: 20),
                  pw.Text('This is to certify that',
                      style: pw.TextStyle(fontSize: 16)),
                  pw.SizedBox(height: 30),
                  pw.Padding(
                    padding: pw.EdgeInsets.symmetric(horizontal: 20),
                    child: pw.SizedBox(
                      width: 350,
                      child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          children: [
                            pw.RichText(
                              text: pw.TextSpan(
                                text: 'Dr.  ',
                                style: pw.TextStyle(
                                    font: font,
                                    color: PdfColor(
                                      0.5,
                                      0.1,
                                      0.1,
                                    ),
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 15),
                                children: <pw.TextSpan>[
                                  pw.TextSpan(
                                      text: 'Rakshitha                                ',
                                      style: pw.TextStyle(
                                          fontSize: 13,
                                          color: PdfColor(0.1, 0.1, 0.1),
                                          fontWeight: pw.FontWeight.bold,
                                          decoration:
                                              pw.TextDecoration.underline)),
                                  pw.TextSpan(
                                    text: ' Bearing Reg No  ',
                                    style: pw.TextStyle(
                                        font: font,
                                        color: PdfColor(
                                          0.5,
                                          0.1,
                                          0.1,
                                        ),
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  pw.TextSpan(
                                      text:
                                          '1605                                                      ',
                                      style: pw.TextStyle(
                                          fontSize: 13,
                                          color: PdfColor(0.1, 0.1, 0.1),
                                          fontWeight: pw.FontWeight.bold,
                                          decoration:
                                              pw.TextDecoration.underline)),
                                ],
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.RichText(
                              text: pw.TextSpan(
                                text: 'Registred with   ',
                                style: pw.TextStyle(
                                    font: font,
                                    color: PdfColor(
                                      0.5,
                                      0.1,
                                      0.1,
                                    ),
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 12),
                                children: <pw.TextSpan>[
                                  pw.TextSpan(
                                      text:
                                          'Karnataka Medical Council                                                            ',
                                      style: pw.TextStyle(
                                          decoration:
                                              pw.TextDecoration.underline,
                                          fontSize: 13,
                                          color: PdfColor(
                                            0.1,
                                            0.1,
                                            0.1,
                                          ),
                                          fontWeight: pw.FontWeight.bold)),
                                ],
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.RichText(
                              text: pw.TextSpan(
                                text: 'Adress ',
                                style: pw.TextStyle(
                                    font: font,
                                    color: PdfColor(
                                      0.5,
                                      0.1,
                                      0.1,
                                    ),
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 12),
                                children: <pw.TextSpan>[
                                  pw.TextSpan(
                                      text:
                                          '16/6 Miller Tank Bund Road, Vasanth Nagar,Bengaluru,Karnataka - 560052',
                                      style: pw.TextStyle(
                                          decoration:
                                              pw.TextDecoration.underline,
                                          fontSize: 11,
                                          color: PdfColor(
                                            0.1,
                                            0.1,
                                            0.1,
                                          ),
                                          fontWeight: pw.FontWeight.bold)),
                                ],
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.RichText(
                              text: pw.TextSpan(
                                text:
                                     'has participated as delegate / faculty in ',
                                style: pw.TextStyle(
                                    font: font,
                                    color: PdfColor(
                                      0.5,
                                      0.1,
                                      0.1,
                                    ),
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 12),
                                children: <pw.TextSpan>[
                                  pw.TextSpan(
                                      text:
                                          'Evidence Based Mdicines                                                  ',
                                      style: pw.TextStyle(
                                          decoration:
                                              pw.TextDecoration.underline,
                                          fontSize: 12,
                                          color: PdfColor(
                                            0.1,
                                            0.1,
                                            0.1,
                                          ),
                                          fontWeight: pw.FontWeight.bold)),
                                ],
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.RichText(
                              text: pw.TextSpan(
                                text:
                                    '(CME Programmes/WorkShops/Seminars/Conferences)held on Date/Month/Year   ',
                                style: pw.TextStyle(
                                    font: font,
                                    color: PdfColor(
                                      0.5,
                                      0.1,
                                      0.1,
                                    ),
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 10),
                                children: <pw.TextSpan>[
                                  pw.TextSpan(
                                      text: '09 / 12 / 2022',
                                      style: pw.TextStyle(
                                          decoration:
                                              pw.TextDecoration.underline,
                                          fontSize: 12,
                                          color: PdfColor(
                                            0.1,
                                            0.1,
                                            0.1,
                                          ),
                                          fontWeight: pw.FontWeight.bold)),
                                ],
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.RichText(
                              text: pw.TextSpan(
                                text:
                                    'Karnataka Medical Council has granted    ',
                                style: pw.TextStyle(
                                    font: font,
                                    color: PdfColor(
                                      0.5,
                                      0.1,
                                      0.1,
                                    ),
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 10),
                                children: <pw.TextSpan>[
                                  pw.TextSpan(
                                    text: '1    ',
                                    style: pw.TextStyle(
                                        decoration: pw.TextDecoration.underline,
                                        fontSize: 12,
                                        color: PdfColor(
                                          0.1,
                                          0.1,
                                          0.1,
                                        ),
                                        fontWeight: pw.FontWeight.bold),
                                  ),
                                  pw.TextSpan(
                                    text: 'credit hours for delegates/faculty.               ',
                                    style: pw.TextStyle(
                                        font: font,
                                        color: PdfColor(
                                          0.5,
                                          0.1,
                                          0.1,
                                        ),
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.RichText(
                              text: pw.TextSpan(
                                text: 'Vide Letter No    ',
                                style: pw.TextStyle(
                                    font: font,
                                    color: PdfColor(
                                      0.5,
                                      0.1,
                                      0.1,
                                    ),
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 10),
                                children: <pw.TextSpan>[
                                  pw.TextSpan(
                                    text: '_______________',
                                    style: pw.TextStyle(
                                        fontSize: 12,
                                        color: PdfColor(
                                          0.1,
                                          0.1,
                                          0.1,
                                        ),
                                        fontWeight: pw.FontWeight.bold),
                                  ),
                                  pw.TextSpan(
                                    text: '  Dated   ',
                                    style: pw.TextStyle(
                                        font: font,
                                        color: PdfColor(
                                          0.5,
                                          0.1,
                                          0.1,
                                        ),
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 10),
                                  ),
                                  pw.TextSpan(
                                    text: '09 / 12 / 2022                                            ',
                                    style: pw.TextStyle(
                                        decoration: pw.TextDecoration.underline,
                                        fontSize: 12,
                                        color: PdfColor(
                                          0.1,
                                          0.1,
                                          0.1,
                                        ),
                                        fontWeight: pw.FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            pw.SizedBox(height: 60),
                            pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceAround,
                                children: [
                                  pw.Column(children: [
                                    pw.Text('Scan Qr Code',
                                        style: pw.TextStyle(
                                          font: font,
                                          fontSize: 14,
                                        )),
                                    pw.Image(pw.MemoryImage(qrCode),
                                        width: 70, height: 70),
                                  ]),
                                  pw.Column(children: [
                                    pw.Text('Candidate Photo',
                                        style: pw.TextStyle(
                                          font: font,
                                          fontSize: 14,
                                        )),
                                    pw.Image(pw.MemoryImage(userImage),
                                        width: 70, height: 70),
                                  ]),
                                  pw.Column(children: [
                                    
                                    pw.Text('Registrar Signature',
                                        style: pw.TextStyle(
                                          font: font,
                                          fontSize: 14,
                                        )),
                                        pw.SizedBox(height: 20),
                                    pw.Image(pw.MemoryImage(signature),
                                        width: 70, height: 70),
                                    pw.SizedBox(height: 20),
                                  ])
                                ])
                          ]),
                    ),
                  ),
                ])));
      },
    ));
    final outPut = await getTemporaryDirectory();
    var filePath = '${outPut.path}/certificatename.pdf';

    final files = await io.File(filePath).writeAsBytes(await pdf.save());

    await OpenFile.open(files.path);
  }
}

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class PdfApi {
  // static Future<File> genaratePdf(test) async {
  //   final pdf = pw.Document();
  //   pdf.addPage(pw.Page(
  //     pageFormat: PdfPageFormat.a4,
  //     build: (pw.Context context) {
  //       return pw.Center(
  //         child: pw.Text(test),
  //       ); // Center
  //     }));
  //   return saveDocument(name:'my_example.pdf',pdf:pdf);
  // }


  // Future<File>saveDocument({required String name,required Document pdf})async{

  //   final bytes=await pdf.save();
  //   final dir =await getApplicationDocumentsDirectory();
  //   final file = File('${dir.path}/$name');
  //   await file.writeAsBytes(bytes);
  // }
}

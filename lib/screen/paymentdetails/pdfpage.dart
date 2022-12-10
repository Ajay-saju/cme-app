import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';

class PdfViwerPage extends StatefulWidget {
  final String path;
  const PdfViwerPage({Key? key, required this.path}) : super(key: key);

  @override
  State<PdfViwerPage> createState() => _PdfViwerPageState();
}

class _PdfViwerPageState extends State<PdfViwerPage> {
  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(path: widget.path,);
  }
}
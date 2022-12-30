import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class SyncPdfViwer extends StatefulWidget {
  final String filePath;
  const SyncPdfViwer({Key? key, required this.filePath}) : super(key: key);

  @override
  State<SyncPdfViwer> createState() => _SyncPdfViwerState();
}

class _SyncPdfViwerState extends State<SyncPdfViwer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PDFView(
        filePath: widget.filePath,
      ),
    );
  }
}

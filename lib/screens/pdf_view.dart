import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
class PdfS extends StatelessWidget {
  String File;
  PdfS(@required this.File);
  @override
  Widget build(BuildContext context) {
    // String File = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.only(top:35),
            child: SfPdfViewer.network(
                File,
                canShowScrollHead: true,
                canShowScrollStatus: true,
                canShowPaginationDialog: false,
                // pageLayoutMode: PdfPageLayoutMode.continuous,
            )));
  }
}


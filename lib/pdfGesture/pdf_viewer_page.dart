import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:path/path.dart';

class PDFViewerPage extends StatefulWidget {
  final File file;
  final String name;

  const PDFViewerPage({
    Key? key,
    required this.file,
    required this.name,
  }) : super(key: key);

  @override
  State<PDFViewerPage> createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  late PDFViewController controller;
  int pages = 0;
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    // final name = basename(widget.file.path);
    final pageText = '${indexPage + 1} of $pages';

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: Colors.grey[900],
        actions: [
          Center(
            child: Text(pageText),
          ),
          IconButton(
            onPressed: () {
              final page = indexPage - 1;
              controller.setPage(page);
            },
            icon: const Icon(
              Icons.chevron_left,
              size: 32,
            ),
          ),
          IconButton(
            onPressed: () {
              final page = indexPage + 1;
              controller.setPage(page);
            },
            icon: const Icon(
              Icons.chevron_right,
              size: 32,
            ),
          ),
        ],
      ),
      body: PDFView(
        filePath: widget.file.path,
        // swipeHorizontal: true, swipe gauceh droite
        pageSnap: false, // pouvoir aller entre les pages
        pageFling: false, // ouvoir swipe plusieurs pages
        onRender: (pages) => setState(() => this.pages = pages!),
        onViewCreated: (controller) =>
            setState(() => this.controller = controller),
        onPageChanged: (indexPage, _) =>
            setState(() => this.indexPage = indexPage!),
      ),
    );
  }
}

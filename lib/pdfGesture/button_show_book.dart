import 'dart:io';

import 'package:flutter/material.dart';
import 'package:palmhelp/pdfGesture/pdf_gesure.dart';
import 'package:palmhelp/pdfGesture/pdf_viewer_page.dart';

Widget buttonShowBook(
    BuildContext context, String version, String path, String title) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () async {
        path = 'assets/book/$version/$path.pdf';
        final file = await PDFGesture.loadAsset(path);
        // ignore: use_build_context_synchronously
        openPDF(context, file, title);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset('assets/logo/book/$path.png'),
              Text(title),
            ],
          ),
        ),
      ),
    ),
  );
}

void openPDF(BuildContext context, File file, String name) =>
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PDFViewerPage(
          file: file,
          name: name,
        ),
      ),
    );

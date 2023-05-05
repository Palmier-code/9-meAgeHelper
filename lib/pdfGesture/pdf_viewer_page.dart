import 'dart:io';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:palmhelp/Utils/pop_up.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// ignore: depend_on_referenced_packages
import 'package:syncfusion_flutter_pdf/pdf.dart';

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
  late PdfTextSearchResult _searchResult;
  late PdfViewerController _pdfViewerController;
  late Widget customSearchBar;
  late String search;

  bool isOpen = false;

  @override
  initState() {
    _pdfViewerController = PdfViewerController();
    _searchResult = PdfTextSearchResult();
    customSearchBar = Text(widget.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(widget.name),
        title: customSearchBar,
        backgroundColor: Colors.grey[900],
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (isOpen == false) {
                  isOpen = true;
                  customSearchBar = ListTile(
                    title: TextField(
                      onChanged: (tmp) {
                        setState(() {
                          search = tmp;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Recherche ?',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                } else {
                  if (search != "" || search.isNotEmpty) {
                    _searchResult = _pdfViewerController.searchText(
                      search,
                      searchOption: TextSearchOption.caseSensitive,
                    );
                    if (kIsWeb) {
                      setState(() {});
                    } else {
                      _searchResult.addListener(
                        () {
                          if (_searchResult.hasResult) {
                            print("trouver");
                            setState(() {});
                          }
                          if (_searchResult.isSearchCompleted) {
                            popUp(
                              context: context,
                              string:
                                  "Désoler mais votre recherche ne correspond à rien",
                            );
                          }
                        },
                      );
                    }
                  }
                }
              });
            },
            icon: const Icon(Icons.search),
          ),
          // IconButton(
          //   icon: const Icon(
          //     Icons.search,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {
          //     _searchResult = _pdfViewerController.searchText(
          //       'the', // mettre la recherche que l'on veut ici
          //       searchOption: TextSearchOption.caseSensitive,
          //     );
          //     if (kIsWeb) {
          //       setState(() {});
          //     } else {
          //       _searchResult.addListener(
          //         () {
          //           if (_searchResult.hasResult) {
          //             setState(() {});
          //           }
          //         },
          //       );
          //     }
          //   },
          // ),
          Visibility(
            visible: isOpen && _searchResult.hasResult,
            child: IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_up,
                color: Colors.white,
              ),
              onPressed: () {
                _searchResult.previousInstance();
              },
            ),
          ),
          Visibility(
            visible: isOpen && _searchResult.hasResult,
            child: IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
              onPressed: () {
                _searchResult.nextInstance();
              },
            ),
          ),
          Visibility(
            visible: isOpen,
            child: IconButton(
              icon: const Icon(
                Icons.clear,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  isOpen = false;
                  customSearchBar = Text(widget.name);
                  _searchResult.clear();
                });
              },
            ),
          ),
        ],
      ),
      body: SfPdfViewer.file(
        widget.file,
        controller: _pdfViewerController,
        currentSearchTextHighlightColor: Colors.yellow.withOpacity(0.6),
        otherSearchTextHighlightColor: Colors.yellow.withOpacity(0.3),
      ),
    );
  }
}

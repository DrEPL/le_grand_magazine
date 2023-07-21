import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class EditionCard extends StatefulWidget {
  final String imageUrl;
  final String pdfUrl;
  final DateTime dateEdition;
  final String? title;
  final String? theme;
  final String numero;
  final String periode;

  const EditionCard(
      {super.key,
      required this.imageUrl,
      required this.pdfUrl,
      required this.dateEdition,
      this.title,
      this.theme,
      required this.numero,
      required this.periode});

  @override
  State<EditionCard> createState() => _EditionCardState();
}

class _EditionCardState extends State<EditionCard> {
  double _progress = 0.0;
  bool _isDownloading = false;
  int compteur = 0;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(screenSize.width * 0.05),
      child: SizedBox(
        height: 410,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                // borderRadius: BorderRadius.circular(8),
                // clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  width: screenSize.width,
                  height: 350,
                  child: Image.network(widget.imageUrl, fit: BoxFit.fill),
                ),
              ),
              // const SizedBox(height: 8),
              // Padding(
              //   padding: const EdgeInsets.only(left: 10, right: 10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       Text(widget.numero,
              //           style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              //               color: Colors.red, fontWeight: FontWeight.normal)),
              //       Text(widget.periode,
              //           style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              //               color: Colors.red, fontWeight: FontWeight.normal, letterSpacing: 1),),
              //     ],
              //   ),
              // ),
              // const SizedBox(height: 8),
              // Padding(
              //   padding: const EdgeInsets.only(left: 10, right: 10),
              //   child: Flexible(
              //     child: Text(
              //       widget.title,
              //       style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              //             fontWeight: FontWeight.bold,
              //             fontSize: (screenSize.width < 380) ? 10 : 12,
              //           ),
              //       maxLines: 3,
              //       softWrap: true,
              //       textAlign: TextAlign.justify,
              //       overflow: TextOverflow.ellipsis,
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 5),
              // Padding(
              //   padding: const EdgeInsets.only(left: 10, right: 10),
              //   child: Flexible(
              //     child: Text(
              //       widget.theme.toLowerCase(),
              //       style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              //             fontWeight: FontWeight.w300,
              //             color: Colors.grey,
              //             fontSize: (screenSize.width < 380) ? 10 : 12,
              //           ),
              //       maxLines: 2,
              //       softWrap: true,
              //       textAlign: TextAlign.justify,
              //       overflow: TextOverflow.ellipsis,
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Text(widget.dateEdition.toString(),
                      //     style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      //         color: Colors.grey, fontWeight: FontWeight.w500)),
                      Text(widget.numero,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                      Text(
                        widget.periode,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                      IconButton(
                          onPressed: () {
                            startDownload();
                          },
                          icon: const Icon(
                            Icons.download,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> startDownload() async {
    setState(() {
      _isDownloading = true;
      _progress = 0.0;
    });

    final File? file = await FileDownloader.downloadFile(
      url: widget.pdfUrl,
      name: "LGM ${widget.periode}",
      onProgress: (String? fileName, double progress) {
        setState(() {
          _progress = progress;
          compteur++;
        });
        if (compteur <= 1) {
          showDialog(
            context: context,
            builder: (_) => _buildProgressIndicator(),
          );
        } else {
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (_) => _buildProgressIndicator(),
          );
        }
      },
      onDownloadCompleted: (path) {
        setState(() {
          _isDownloading = false;
          compteur = 0;
        });
      },
    );

    if (file != null) {
      debugPrint('FILE: ${file.path}');
    }
  }

  Widget _buildProgressIndicator() {
    return AlertDialog(
      title: _progress == 100
          ? const Text('Téléchargement terminé')
          : const Text('Téléchargement en cours'),
      content: _progress == 100
          ? const Text("consulter le dossier téléchargement")
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LinearProgressIndicator(value: _progress),
                const SizedBox(height: 16.0),
                Text('$_progress %'),
              ],
            ),
      actions: [
        if (!_isDownloading && _progress == 100)
          Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Ok")))
      ],
    );
  }
}

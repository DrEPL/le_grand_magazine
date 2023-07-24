import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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
                            _showDownloadDialog(context);
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

  Future<void> downloadPDF(String url, String savePath,
      {Function(double)? onProgress, Function(String)? onCompleted}) async {
    final dio = Dio();
    try {
      await dio.download(url, savePath, onReceiveProgress: (received, total) {
        if (total != -1 && onProgress != null) {
          double progress = received / total;
          onProgress(progress);
        }
      });

      if (onCompleted != null) {
        onCompleted(savePath);
      }
    } catch (e) {
      debugPrint('Erreur de téléchargement: $e');
    }
  }

  void _showDownloadDialog(BuildContext context) async {
    String pdfUrl = widget.pdfUrl;
    String name = "LGM_${widget.periode.replaceFirst(' ', '')}";
    String savePath = '/storage/emulated/0/Download/$name.pdf';
    double _progress = 0.0;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Téléchargement en cours'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LinearProgressIndicator(value: _progress),
                  const SizedBox(height: 16.0),
                  Text('${(_progress * 100).toStringAsFixed(2)}%'),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Center(child: Text('Annuler')),
                ),
              ],
            );
          },
        );
      },
    );

    await downloadPDF(
      pdfUrl,
      savePath,
      onProgress: (progress) {
        setState(() {
          _progress = progress;
        });
      },
      onCompleted: (path) {
        Navigator.pop(context); // Ferme la boîte de dialogue
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: const Text('Téléchargement terminé'),
              content: Text(
                  'Le fichier a été téléchargé avec succès à l\'emplacement suivant:\nTéléchargement/$name.pdf'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Center(child: Text('OK')),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

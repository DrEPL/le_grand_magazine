import 'package:flutter/material.dart';
import 'package:le_grand_magazine/backend/models/video.dart';
import 'Video_api.dart';

class VideoListProvider extends ChangeNotifier {
  List<Video> listOfVideo = [];

  void addVideo(Video video) {
    listOfVideo.add(video);
    notifyListeners();
  }

  bool areVideosEqual(List<Video> newVideos, List<Video> oldVideos) {
    if (newVideos.length != oldVideos.length) {
      return false;
    }

    for (int i = 0; i < newVideos.length; i++) {
      if (newVideos[i] != oldVideos[i]) {
        return false;
      }
    }

    return true; // Les listes sont égales
  }

  listVideos() async {
    List<Video> listOfNewVideos = [];
    // Pour effectuer le fetch des nouveaux videos depuis l'API
    List<dynamic> newVideos = await getVideos();
    
    //Pour convertir les données de la liste Map en liste des videos 
    listOfNewVideos = newVideos.map((video) => Video.fromMap(video)).toList();
    listOfVideo.clear();

    // Pour vérifier si les nouveaux videos sont différentes des videos actuels
    if (!areVideosEqual(listOfVideo, listOfNewVideos)) {
      // Mettre à jour seulement les éditions qui ont changé
      listOfVideo.clear();
      listOfVideo.addAll(listOfNewVideos);
      notifyListeners();
      return true; // Catégories mises à jour avec succès
    } else {
      return false; // Aucun changement dans les éditions
    }
  }

  Future<List<Video>> listOfVideos() async {
    List<dynamic> videos = await getVideos();
    final listOfVideos = videos.map((video) => Video.fromMap(video)).toList();
    return listOfVideos;
  }
}

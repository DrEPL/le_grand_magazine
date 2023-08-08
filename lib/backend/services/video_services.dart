import 'package:flutter/material.dart';
import 'package:le_grand_magazine/backend/models/video.dart';
import 'Video_api.dart';
import 'live_api.dart';

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
    List<dynamic> newLives = await getLives();

    //Pour convertir les données de la liste Map en liste des videos
    List<Video> listOfNewVideos1 =
        newVideos.map((video) => Video.fromMap(video)).toList();
    List<Video> listOfLives =
        newLives.map((video) => Video.fromMap(video)).toList();
    // Ajouter les vidéos de listOfNewVideos1 et listOfNewVideos2 à listOfNewVideos
    listOfNewVideos = [...listOfLives, ...listOfNewVideos1];
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
    List<dynamic> newLives = await getLives();
    List<Video> listOfLives =
        newLives.map((video) => Video.fromMap(video)).toList();
    // Ajouter les vidéos de listOfNewVideos1 et listOfNewVideos2 à listOfNewVideos
    final listOfVideos = videos.map((video) => Video.fromMap(video)).toList();
    final listOfNewVideos = [...listOfLives, ...listOfVideos];

    return listOfNewVideos;
  }
}

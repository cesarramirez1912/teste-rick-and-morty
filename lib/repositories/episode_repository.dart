import 'dart:async';
import 'package:get/get_connect/connect.dart';

import 'package:teste_rick_morty/models/caracter_model.dart';
import 'package:teste_rick_morty/models/episode_model.dart';

import 'package:teste_rick_morty/models/response_model.dart';
import 'package:teste_rick_morty/services/rest_service.dart';

class RepositoryEpisode extends GetConnect {
  Future<EpisodeModel> fetchEpisode({String id}) async {
    Response res;
    try {
      res = await get(RestRoutes.EPISODE + "/${id}");
      return EpisodeModel.fromJson(res.body);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<CaracterModel> fetchCaracter({String url}) async {
    Response res;
    try {
      res = await get(url);
      return CaracterModel.fromJson(res.body);
    } catch (e) {
      throw Exception(e);
    }
  }
}

import 'dart:async';
import 'package:get/get_connect/connect.dart';

import 'package:teste_rick_morty/models/response_model.dart';
import 'package:teste_rick_morty/services/rest_service.dart';

class RepositoryHome extends GetConnect {
  Future<ResponseModel> fetchEpisodes() async {
    Response res;
    try {
      res = await get(RestRoutes.EPISODE);
      return ResponseModel.fromJson(res.body);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ResponseModel> fetchMoreEpisodes(String url) async {
    Response res;
    try {
      res = await get(url);
      return ResponseModel.fromJson(res.body);
    } catch (e) {
      throw Exception(e);
    }
  }
}

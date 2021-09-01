import 'package:teste_rick_morty/models/info_model.dart';
import 'package:teste_rick_morty/models/result_model.dart';

class ResponseModel {
  InfoModel info;
  List<ResultModel> results;

  ResponseModel({this.info, this.results});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    info = (json['info'] != null ? new InfoModel.fromJson(json: json["info"]) : null);
    if (json['results'] != null) {
      results = <ResultModel>[];
      json['results'].forEach((v) {
        results.add(new ResultModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.info != null) {
      data['info'] = this.info.toJson();
    }
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
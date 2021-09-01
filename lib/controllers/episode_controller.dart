import 'package:get/get.dart';
import 'package:teste_rick_morty/models/caracter_model.dart';
import 'package:teste_rick_morty/models/episode_model.dart';
import 'package:teste_rick_morty/models/response_model.dart';
import 'package:teste_rick_morty/models/result_model.dart';
import 'package:teste_rick_morty/repositories/episode_repository.dart';
import 'package:teste_rick_morty/repositories/home_repository.dart';

class ControllerEpisode extends GetxController {
  Rx<EpisodeModel> episode = EpisodeModel().obs;
  RxList<CaracterModel> listCaracter = <CaracterModel>[].obs;
  RepositoryEpisode _repositoryEpisode;

  RxBool isLoadingEpisode = false.obs;
  RxBool isLoadingCaracters = false.obs;

  @override
  void onInit() async {
    ResultModel data = Get.arguments;
    _repositoryEpisode = RepositoryEpisode();
    isLoadingEpisode.value = true;
    fetchEpisode(data.id.toString());
    fetchCaracters(data.characters);
    super.onInit();
  }

  Future<void> fetchEpisode(String id) async {
    try {
      var res = await _repositoryEpisode.fetchEpisode(id: id);
      if (!res.id.isNull) {
        episode.value = res;
      }
    } finally {
      isLoadingEpisode.value = false;
    }
  }

  Future<void> fetchCaracters(List<String> urls) async {
    try {
      for (var url in urls) {
        var res = await _repositoryEpisode.fetchCaracter(url: url);
        listCaracter.add(res);
      }
    } finally {

    }
  }
}

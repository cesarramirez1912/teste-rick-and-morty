import 'package:get/get.dart';
import 'package:teste_rick_morty/models/response_model.dart';
import 'package:teste_rick_morty/models/result_model.dart';
import 'package:teste_rick_morty/repositories/home_repository.dart';

class ControllerHome extends GetxController {
  Rx<ResponseModel> response = ResponseModel().obs;
  RepositoryHome _repositoryHome;

  RxBool isLoadingEpisodes = false.obs;
  RxBool isLoadingMoreEpisodes = false.obs;

  @override
  void onInit() async {
    _repositoryHome = RepositoryHome();
    await fetchEpisodes();
    super.onInit();
  }

  Future<void> fetchEpisodes() async {
    isLoadingEpisodes.value = true;
    try {
      var res = await _repositoryHome.fetchEpisodes();
      if (res.results.length > 0) {
        response.value = res;
      }
    } finally {
      isLoadingEpisodes.value = false;
    }
  }

  Future<void> fetchMoreEpisodes(String url) async {
    isLoadingMoreEpisodes.value = true;
    try {
      var res = await _repositoryHome.fetchMoreEpisodes(url);
      if (res.results.length > 0) {
        response.value.info = res.info;
        response.value.results.addAll(res.results);
        response.refresh();
      }
    } finally {
      isLoadingMoreEpisodes.value = false;
    }
  }
}

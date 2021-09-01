import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:teste_rick_morty/components/default_page.dart';
import 'package:teste_rick_morty/components/home_body.dart';
import 'package:teste_rick_morty/components/loading_episodes.dart';
import 'package:teste_rick_morty/controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  ControllerHome _controller = Get.put(ControllerHome());

  @override
  Widget build(BuildContext context) {
    return defaultPage(
      title: "Episodios",
      body: Obx(
        () {
          return _controller.isLoadingEpisodes.value
              ? loadingEpisodes()
              : homeBody(_controller.response.value);
        },
      ),
    );
  }
}

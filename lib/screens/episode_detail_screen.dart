import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_rick_morty/components/caracter_body.dart';
import 'package:teste_rick_morty/components/default_page.dart';
import 'package:teste_rick_morty/components/loading_episode.dart';
import 'package:teste_rick_morty/controllers/episode_controller.dart';

class EpisodeDetailScreen extends StatelessWidget {
  ControllerEpisode _controllerEpisode = Get.put(ControllerEpisode());

  @override
  Widget build(BuildContext context) {
    return defaultPage(
      body: Obx(
        () {
          return _controllerEpisode.isLoadingEpisode.value
              ? loadingEpisode()
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 18,
                        ),
                        Text(
                          _controllerEpisode.episode.value.name,
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w900,
                              letterSpacing: -0.8),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        subText(_controllerEpisode.episode.value.airDate),
                        SizedBox(
                          height: 3,
                        ),
                        subText(_controllerEpisode.episode.value.episode),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Personagens deste capitulo:",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              letterSpacing: -0.8),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Expanded(
                          child: bodyCaracter(
                            _controllerEpisode.listCaracter.value,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}

Widget subText(String text) {
  return Text(
    text,
    style: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey[400]),
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_rick_morty/controllers/home_controller.dart';
import 'package:teste_rick_morty/models/response_model.dart';
import 'package:teste_rick_morty/models/result_model.dart';
import 'package:teste_rick_morty/routes/routes.dart';

Widget homeBody(ResponseModel response) {
  final ControllerHome _controllerHome = Get.find();
  return ListView.builder(
    itemCount: response.results.length,
    itemBuilder: (context, index) {
      if (index + 1 >= response.results.length && response.info.next != null) {
        return Container(
          child: Column(
            children: [
              listTile(response.results[index]),
              Obx(
                () => _controllerHome.isLoadingMoreEpisodes.value
                    ? Padding(
                        padding: EdgeInsets.only(bottom: 20, top: 8),
                        child: CircularProgressIndicator(),
                      )
                    : TextButton(
                        onPressed: () => _controllerHome
                            .fetchMoreEpisodes(response.info.next),
                        child: Text(
                          "Carregar mais capitulos",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        );
      } else {
        return Container(
          child: Column(
            children: [listTile(response.results[index])],
          ),
        );
      }
    },
  );
}

Widget listTile(ResultModel result) {
  return ListTile(
    onTap: () => Get.toNamed(RoutesManager.EPISODE_DETAIL, arguments: result),
    title: Text(
      result.name.toString(),
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
    subtitle: Text(result.airDate.toString()),
    isThreeLine: true,
    leading: new CircleAvatar(
      backgroundColor: Colors.grey[300],
      child: new Text(
        result.id.toString(),
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
      ),
    ),
    trailing: new Icon(
      Icons.arrow_forward_ios_sharp,
      size: 12,
      color: Colors.grey,
    ),
  );
}

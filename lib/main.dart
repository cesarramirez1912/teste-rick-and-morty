import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_rick_morty/routes/routes.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesManager.HOME,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ).copyWith(),
      ),
      getPages: RoutesManager.getRoutes(),
    ),
  );
}

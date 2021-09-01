import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultPage({String title, Widget body}) {
  return Scaffold(
    appBar: AppBar(
      title: Text(title ?? ""),
      backgroundColor: Color.fromRGBO(64, 148, 66, 1.0),
    ),
    body: body ?? Container(),
  );
}

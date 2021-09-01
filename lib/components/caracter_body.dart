import 'package:flutter/material.dart';
import 'package:teste_rick_morty/models/caracter_model.dart';

Widget bodyCaracter(List<CaracterModel> list) {
  return GridView.builder(
    physics: BouncingScrollPhysics(),
    itemCount: list.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 5.0,
    ),
    itemBuilder: (context, index) {
      return Container(
        height: 140,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300], width: 1),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  image: DecorationImage(
                    image: NetworkImage(list[index].image),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              list[index].name,
              style: TextStyle(fontWeight: FontWeight.w500),
            )),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      );
    },
  );
}

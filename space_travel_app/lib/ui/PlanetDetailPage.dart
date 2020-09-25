import 'package:flutter/material.dart';
import 'package:space_travel_app/model/Planet.dart';
import 'package:space_travel_app/model/Planets.dart';

import 'DetailAppBar.dart';
import 'PlanetDetailBody.dart';


class PlanetDetailPage extends StatelessWidget {

  final Planet planet;

  PlanetDetailPage(String id) :
        planet = PlanetDao.getPlanetById(id);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new PlanetDetailBody(planet),
          new DetailAppBar(),
        ],
      ),
    );
  }
}
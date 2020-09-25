import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_travel_app/model/Planet.dart';
import 'package:space_travel_app/Theme.dart' as Theme;

import 'common/planet_summary.dart';
import 'common/separator.dart';

class PlanetDetailBody extends StatelessWidget {
  final Planet planet;

  PlanetDetailBody(this.planet);

  @override
  Widget build(BuildContext context) {
//    return Stack(
//      children: <Widget>[
//        new Container(
//          color: Theme.Colors.planetPageBackground,
//          child: new Center(
//            child: new Hero(
//                tag: 'planet-icon-${planet.id}',
//                child: new Image(
//                  image: new AssetImage(planet.image),
//                  height: Theme.Dimens.planetHeight,
//                  width: Theme.Dimens.planetWidth,
//                )),
//          ),
//        )
//      ],
//    );
    return new Scaffold(
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: Theme.Colors.planetPageBackground,
        child: new Stack(
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            _getContent(),
            _getToolbar(context),
          ],
        ),
      ),
    );
  }

  // Get Planet Image from Model
  Container _getBackground() {
    return Container(
      child: Image.network(
        planet.picture,
        fit: BoxFit.cover,
        height: 300.0,
      ),
      constraints: BoxConstraints.expand(height: 295.0),
    );
  }

  // Get Gradient Color
  Container _getGradient() {
    return new Container(
      margin: new EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: <Color>[new Color(0x00736AB7), new Color(0xFF736AB7)],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Container _getContent() {
    final _overviewTitle = "Overview".toUpperCase();
    return new Container(
      child: new ListView(
        padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
        children: <Widget>[
          new PlanetSummary(
            planet,
            horizontal: false,
          ),
          new Container(
            padding: new EdgeInsets.symmetric(horizontal: 32.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  _overviewTitle,
                  style: Theme.TextStyles.headerTextStyle,
                ),
                new Separator(),
                new Text(planet.description, style: Theme.TextStyles.commonTextStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _getToolbar(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: new BackButton(color: Colors.white),
    );
  }
}

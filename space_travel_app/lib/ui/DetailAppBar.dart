import 'package:space_travel_app/Theme.dart' as Theme;
import 'package:flutter/material.dart';

class DetailAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top
      ),
      child: Row(
        children: <Widget>[
          new BackButton(color: Theme.Colors.appBarIconColor,)
        ],
      ),
    );
  }
}

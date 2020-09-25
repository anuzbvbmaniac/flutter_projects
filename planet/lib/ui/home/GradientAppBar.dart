import 'package:flutter/material.dart';
import 'package:planet/Theme.dart' as Theme;

class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 66.0;

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    // get Status bar Height
    final double statusbarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusbarHeight),
      height: statusbarHeight + barHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Theme.Colors.appBarGradientStart, Theme.Colors.appBarGradientEnd],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.5, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp
        )
      ),
      child: Center(
        child: Text(
          title,
          style: Theme.TextStyles.appBarTitle,
        ),
      ),
    );
  }
}

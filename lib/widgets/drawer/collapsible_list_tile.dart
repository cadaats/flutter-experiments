import 'package:dashboard/constants.dart';
import 'package:dashboard/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CollapsibleListTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final AnimationController animationController;

  CollapsibleListTile(
      {@required this.title,
      @required this.icon,
      @required this.animationController});

  @override
  State<StatefulWidget> createState() => CollapsibleListTileState();
}

class CollapsibleListTileState extends State<CollapsibleListTile> {
  Animation<double> widthAnimation, sizedBoxAnimation;
  @override
  void initState() {
    super.initState();
    widthAnimation = Tween(begin: maxWidth, end: minWidth)
        .animate(widget.animationController);
    sizedBoxAnimation =
        Tween(begin: 10.0, end: 0.0).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthAnimation.value,
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        children: <Widget>[
          Icon(
            widget.icon,
            color: Colors.white,
            size: 25.0,
          ),
          SizedBox(
            width: sizedBoxAnimation.value,
          ),
          (widthAnimation.value > 200)
              ? Text(
                  widget.title,
                  style: defaultListTextStyle,
                )
              : Container()
        ],
      ),
    );
  }
}

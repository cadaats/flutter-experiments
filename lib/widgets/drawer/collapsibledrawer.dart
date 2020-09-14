import 'package:dashboard/models/navigation_model.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../themes.dart';
import 'collapsible_list_tile.dart';

class CollapsibleDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CollapsibleDrawerState();
}

class CollapsibleDrawerState extends State<CollapsibleDrawer>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    widthAnimation = Tween<double>(begin: minWidth, end: maxWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, widget) => getWidget(context, widget));
  }

  Widget getWidget(BuildContext context, Widget widget) {
    return Container(
        color: drawerBackgroundColor,
        width: widthAnimation.value,
        child: Column(
          children: <Widget>[
            CollapsibleListTile(
              title: 'Nikola, Tesla',
              icon: Icons.person,
              animationController: _animationController,
            ),
            Divider(
              color: Colors.red[300],
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, counter) {
                  return CollapsibleListTile(
                      title: navigationItems[counter].title,
                      icon: navigationItems[counter].icon,
                      animationController: _animationController);
                },
                itemCount: navigationItems.length,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isCollapsed = !isCollapsed;
                  isCollapsed
                      ? _animationController.forward()
                      : _animationController.reverse();
                });
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.menu_arrow,
                progress: _animationController,
                color: Colors.white,
                size: 30.0,
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ));
  }
}

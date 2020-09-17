import 'package:dashboard/widgets/search/customsearch.dart';
import 'package:dashboard/widgets/drawer/collapsibledrawer.dart';
import 'package:dashboard/widgets/fabdial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

void main() {
  runApp(DashboardApp());
}

class DashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Fun with flutter',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: new DashboardHome(),
    );
  }
}

class DashboardHome extends StatefulWidget {
  @override
  _DashboardHomePageState createState() => new _DashboardHomePageState();
}

class _DashboardHomePageState extends State<DashboardHome> {
  var titleBarContent = 'Dashboard';

  @override
  Widget build(BuildContext context) {
    var childButtons = List<FabDial>();

    childButtons.add(FabDial(
        hasLabel: true,
        labelText: "Choo choo",
        currentButton: FloatingActionButton(
          heroTag: "train",
          backgroundColor: Colors.redAccent,
          mini: true,
          child: Icon(Icons.train),
          onPressed: () {},
        )));

    childButtons.add(FabDial(
        currentButton: FloatingActionButton(
            heroTag: "airplane",
            backgroundColor: Colors.greenAccent,
            mini: true,
            onPressed: () {},
            child: Icon(Icons.airplanemode_active))));

    childButtons.add(FabDial(
        currentButton: FloatingActionButton(
            heroTag: "directions",
            backgroundColor: Colors.blueAccent,
            mini: true,
            onPressed: () {},
            child: Icon(Icons.directions_car))));

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          titleBarContent,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.access_alarm), onPressed: () {}),
          IconButton(icon: Icon(Icons.notifications_active), onPressed: () {}),
          IconButton(icon: Icon(Icons.view_module), onPressed: () {}),
          Padding(
              padding: const EdgeInsets.only(right: 13.0),
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                      context: context, delegate: CustomSearchDelegate());
                },
              )),
          IconButton(icon: Icon(Icons.chat), onPressed: () {}),
        ],
      ),
      body: Row(
        children: <Widget>[
          CollapsibleDrawer(),
          Expanded(
              child: Container(
            color: Colors.black87,
          )),
          // CollapsibleDrawer(),
        ],
      ),

      floatingActionButton: SpeedDial(
        overlayColor: Colors.green,
        overlayOpacity: 0.2,
        curve: Curves.easeInCubic,
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            backgroundColor: Colors.red,
            child: Icon(Icons.account_balance),
            label: "Accounts",
            onTap: () => print("Accounts"),
          ),
          SpeedDialChild(
            backgroundColor: Colors.blue,
            child: Icon(Icons.ac_unit),
            label: "Orders",
            onTap: () => print("Orders"),
          )
        ],
      ),

      ///FabDialer
      // floatingActionButton: FabDialer(
      //     backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
      //     parentButtonBackground: Colors.redAccent,
      //     orientation: UnicornOrientation.HORIZONTAL,
      //     parentButton: Icon(Icons.menu_open),
      //     childButtons: childButtons),

      ///SIDE BY SIDE
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     FloatingActionButton(
      //       child: Icon(Icons.delete),
      //       onPressed: () {
      //         //...
      //       },
      //       heroTag: null,
      //     ),
      //     SizedBox(
      //       width: 10,
      //     ),
      //     FloatingActionButton(
      //       child: Icon(Icons.star),
      //       onPressed: () {},
      //       heroTag: null,
      //     )
      //   ],
      // ),
    );
    // floatingActionButton: new FloatingActionButton(
    //   onPressed: () {},
    //   child: Icon(Icons.add),
    // ),
    // );
  }
}

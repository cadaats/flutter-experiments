import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;

  NavigationModel({this.title, this.icon});
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: 'Portfolio', icon: Icons.insert_chart),
  NavigationModel(title: 'OMS', icon: Icons.monetization_on),
  NavigationModel(title: 'Trading', icon: Icons.import_export),
  NavigationModel(title: 'Support', icon: Icons.support_agent),
  NavigationModel(title: 'Settings', icon: Icons.settings),
];

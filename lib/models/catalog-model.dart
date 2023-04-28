import 'package:flutter/material.dart';

class CatalogModel {
  final String title;
  final IconData icon;

  CatalogModel({
    required this.title,
    required this.icon,
  });
}

class CatalogData {
  static List<CatalogModel> categories = [
    CatalogModel(title: 'All', icon: Icons.all_out),
    CatalogModel(title: 'Mountains', icon: Icons.terrain),
    CatalogModel(title: 'Forest', icon: Icons.forest),
    CatalogModel(title: 'Beach', icon: Icons.beach_access),
  ];
}

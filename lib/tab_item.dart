// tab_item.dart
import 'package:flutter/material.dart';

enum TabItem { find, history, information }

const Map<TabItem, String> tabName = {
  TabItem.find: 'Szukaj',
  TabItem.history: 'Historia',
  TabItem.information: 'Informacje',
};

const Map<TabItem, MaterialColor> activeTabColor = {
  TabItem.find: Colors.red,
  TabItem.history: Colors.green,
  TabItem.information: Colors.blue,
};


import 'package:flutter/material.dart';
import 'package:training/about_me.dart';
import 'package:training/tab_item.dart';
import 'package:training/tab_navigator.dart';
import 'bottom_navigation.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  var _currentTab = TabItem.history;

  final navigatorKeys = {
    TabItem.find: GlobalKey<NavigatorState>(),
    TabItem.history: GlobalKey<NavigatorState>(),
    TabItem.information: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>      !await navigatorKeys[_currentTab]!.currentState!.maybePop(),
      child: Scaffold(
        body: Stack(children: [
          _buildOffstageNavigator(TabItem.find),
          _buildOffstageNavigator(TabItem.history),
          _buildOffstageNavigatorAboutMe(TabItem.information),
        ]),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }

  Widget _buildOffstageNavigatorAboutMe(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: const AboutMe(),
    );
  }
}

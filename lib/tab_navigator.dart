import 'package:flutter/material.dart';
import 'package:training/color_list_page.dart';
import 'package:training/tab_item.dart';
import 'package:training/tab_navigator_routes.dart';
import 'color_detail_page.dart';

class TabNavigator extends StatelessWidget {
  const TabNavigator({Key? key, required this.navigatorKey, required this.tabItem}) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  // 3
  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, {int materialIndex = 500}) {
    return {
      TabNavigatorRoutes.root: (context) => ColorsListPage(
            color: activeTabColor[tabItem]!,
            title: tabName[tabItem]!,
            onPush: (materialIndex) => _push(context, materialIndex: materialIndex),
          ),
      TabNavigatorRoutes.detail: (context) => ColorDetailPage(
            color: activeTabColor[tabItem]!,
            title: tabName[tabItem]!,
            materialIndex: materialIndex,
          ),
    };
  }

  // 4
  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name]!(context),
        );
      },
    );
  }

  // 5
  void _push(BuildContext context, {int materialIndex = 500}) {
    var routeBuilders = _routeBuilders(context, materialIndex: materialIndex);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => routeBuilders[TabNavigatorRoutes.detail]!(context),
      ),
    );
  }
}

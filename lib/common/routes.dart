import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_components/page/aboutdialog/about_dialog.dart';

final routes = {
  '/AboutDialog': (context, {arguments}) => AboutDialogPage(arguments: arguments)
};

var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};

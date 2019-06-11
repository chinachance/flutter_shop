import 'package:flutter/material.dart';

///app默认配置
class AppConfig {
  final String appName;
  final String appLink;
  final ThemeData theme;
  final bool showPerformanceOverlay;

  AppConfig(
      {this.appName, this.appLink, this.theme, this.showPerformanceOverlay});
}

AppConfig get defaultConfig {
  return new AppConfig(
    appName: 'flutter shop',
    appLink: '',
    theme:
        new ThemeData(brightness: Brightness.light, primaryColor: Colors.blue),
    showPerformanceOverlay: false,
  );
}

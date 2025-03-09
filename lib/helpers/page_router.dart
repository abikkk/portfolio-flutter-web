import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageRouter {
  static final PageRouter _instance = PageRouter._internal();

  factory PageRouter() => _instance;

  PageRouter._internal();

  static PageRouter get instance => _instance;

  Future<void> closeActivity(BuildContext context, {dynamic value}) async {
    Navigator.pop(context, value);
  }

  Future<Object?> openActivity(BuildContext context, Widget page) async {
    return await Navigator.push(context, _getPageRoute(page));
  }

  Future<Object?> replaceActivity(BuildContext context, Widget page) async {
    return await Navigator.pushReplacement(context, _getPageRoute(page));
  }

  PageRoute<Object> _getPageRoute(Widget page) {
    return Platform.isIOS
        ? CupertinoPageRoute(builder: (context) => page)
        : MaterialPageRoute(builder: (context) => page);
  }
}

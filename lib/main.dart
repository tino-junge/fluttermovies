import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'movie_list_page.dart';

void main() => runApp(new MyApp());

final ThemeData kIOSTheme = new ThemeData(
  primarySwatch: Colors.blue,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);
final ThemeData kDefaultTheme = new ThemeData(
  primarySwatch: Colors.red,
  accentColor: Colors.orangeAccent[400],
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'All the Movies',
      theme: defaultTargetPlatform == TargetPlatform.android
        ? kDefaultTheme
        : kIOSTheme,
      home: new MovieListPage()
    ); 
  }
}


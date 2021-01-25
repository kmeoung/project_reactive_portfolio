import 'package:flutter/material.dart';
import 'package:portfolio/screen/screen_main.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: (settings) {
          if (settings.name == '/') {
            return MaterialPageRoute(
              builder: (context) => ScreenMain(),
              settings: RouteSettings(name: '/'),
              maintainState: false,
            );
          }

          Uri uri =
              Uri.parse(settings.name); // uri 는 입력하는 url 경로를 '/'로 나누어 배열로 반환함

          if (uri.pathSegments.first == 'detail') {
            if (uri.pathSegments.length < 2 ||
                uri.pathSegments[1].toString().isEmpty) {
              return MaterialPageRoute(
                builder: (context) => ScreenMain(),
                settings: RouteSettings(name: '/detail'),
                maintainState: false,
              );
            } else {
              int index = int.parse(uri.pathSegments[1].toString());
              if (uri.pathSegments.length < 4 ||
                  uri.pathSegments[3].toString().isEmpty) {
                return MaterialPageRoute(
                  settings: RouteSettings(arguments: '/detail/$index'),
                  maintainState: false,
                  builder: (context) => ScreenMain(),
                );
              }
            }
          }

          return MaterialPageRoute(
            builder: (context) => ScreenMain(),
            settings: RouteSettings(name: '/'),
            maintainState: false,
          );
        },
      ),
    );

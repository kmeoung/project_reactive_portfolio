import 'package:flutter/material.dart';
import 'package:portfolio/widget/widget_main_body.dart';
import 'package:portfolio/widget/widget_main_drawer.dart';

class ScreenMain extends StatelessWidget {
  String title = 'test';

  bool _isWeb() => identical(0, 0.0);

  final drawerItem = WidgetMainDrawer();

  @override
  Widget build(BuildContext context) => _contents(context);

  Widget _contents(BuildContext context) {
    double dpWidth = MediaQuery.of(context).size.width;
    if (_isWeb())
      return (dpWidth < 800) ? _appContents() : _webContents(dpWidth);
    else
      return _appContents();
  }

  /// App Contents
  Widget _appContents() {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: Drawer(
        child: drawerItem,
      ),
      body: WidgetMainBody(
        gridCount: 2,
        itemSpacing: 10.0,
      ),
    );
  }

  /// Web Contents
  Widget _webContents(double dpWidth) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Row(
        children: [
          Container(
            width: dpWidth / 6,
            child: Container(
              color: Colors.grey,
              child: drawerItem,
            ),
          ),
          Expanded(
            child: WidgetMainBody(
              gridCount: 4,
              itemSpacing: 10.0,
            ),
          )
        ],
      ),
    );
  }
}

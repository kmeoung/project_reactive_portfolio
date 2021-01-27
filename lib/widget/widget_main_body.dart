import 'dart:math';

import 'package:flutter/material.dart';

class WidgetMainBody extends StatelessWidget {
  final int gridCount;
  final double itemSpacing;

  final String tempImgUrl =
      'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.zUnZjlh1eETyF9w0AR5OKQHaDt%26pid%3DApi&f=1';

  final List _webList = [
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimages.wallpaperscraft.com%2Fimage%2Fmountains_lake_aerial_view_129710_1920x1080.jpg&f=1&nofb=1',
  ];

  final List _appList = [
    'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwonderfulengineering.com%2Fwp-content%2Fuploads%2F2016%2F02%2Fmobile-wallpaper-55.jpg&f=1&nofb=1',
  ];

  WidgetMainBody({
    Key key,
    @required this.gridCount,
    @required this.itemSpacing,
  }) : super(key: key);

  // todo : custom GridView 생성
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> dpList = [];
    for (int i = 0; i < 100; i++) {
      dpList
          .add((Random().nextBool()) ? displayTest(i, size) : appTest(i, size));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          gridCount,
          (rowIndex) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: dpList
                .where((item) => (dpList.indexOf(item) % gridCount) == rowIndex)
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget displayTest(int index, Size size) => Container(
        margin: EdgeInsets.all(8.0),
        width: size.width > 800 ? size.width / 100 * 16 : size.width / 40 * 16,
        height: size.width > 800 ? size.width / 100 * 9 : size.width / 40 * 9,
        child: Image.network(
          _webList[Random().nextInt(_webList.length)],
          fit: BoxFit.fill,
        ),
      );

  Widget appTest(int index, Size size) => Container(
        margin: EdgeInsets.all(8.0),
        width: size.width > 800 ? size.width / 100 * 9 : size.width / 35 * 9,
        height: size.width > 800 ? size.width / 100 * 16 : size.width / 35 * 16,
        child: Image.network(
          _appList[Random().nextInt(_appList.length)],
          fit: BoxFit.fill,
        ),
      );

  Widget mainItem() => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: Offset(3.0, 3.0),
              blurRadius: 3.0,
            ),
          ],
          image: DecorationImage(
            image: NetworkImage(tempImgUrl),
            fit: BoxFit.contain,
          ),
        ),
      );
}

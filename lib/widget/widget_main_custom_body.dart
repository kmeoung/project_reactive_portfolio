import 'dart:math';

import 'package:flutter/material.dart';

class WidgetMainBody extends StatelessWidget {
  final int gridCount;
  final double itemSpacing;

  final String tempImgUrl =
      'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.zUnZjlh1eETyF9w0AR5OKQHaDt%26pid%3DApi&f=1';

  WidgetMainBody({
    Key key,
    @required this.gridCount,
    @required this.itemSpacing,
  }) : super(key: key);

  // todo : custom GridView 생성
  @override
  Widget build(BuildContext context) {
    List<Widget> dpList = [];
    for (int i = 0; i < 100; i++) {
      dpList.add((Random().nextBool()) ? displayTest() : appTest());
    }

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Expanded(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: List.generate(
            gridCount,
            (rowIndex) => Column(
              mainAxisSize: MainAxisSize.max,
              children: dpList
                  .where((item) => dpList.indexOf(item) % gridCount == rowIndex)
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget displayTest() => Container(
        margin: EdgeInsets.all(8.0),
        width: 100,
        height: 80,
        color: Colors.red,
      );

  Widget appTest() => Container(
        margin: EdgeInsets.all(8.0),
        width: 80,
        height: 120,
        color: Colors.blue,
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

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

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: gridCount,
          mainAxisSpacing: itemSpacing,
          crossAxisSpacing: itemSpacing),
      itemBuilder: (context, index) {
        // return mainItem();
        return Card(
          child: Image.network(
            tempImgUrl,
            fit: BoxFit.contain,
          ),
          color: Colors.white,
          elevation: 5,
        );
      },
    );
  }

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

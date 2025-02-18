import 'package:flutter/cupertino.dart';

class ShopPageView extends StatefulWidget {
  const ShopPageView({Key? key}) : super(key: key);

  @override
  _ShopPageViewState createState() => _ShopPageViewState();
}

class _ShopPageViewState  extends State<ShopPageView> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Shop'),
      ),
      child: Center(
        child: Text('Shop Page'),
      ),
    );
  }
}
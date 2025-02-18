import 'package:flutter/cupertino.dart';
import 'package:shoe_page_flutter/src/view/ShopPageView.dart';

class Routes {

  static const String home = '/';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const ShopPageView(),
  };

}
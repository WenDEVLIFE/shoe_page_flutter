import 'package:flutter/material.dart';
import 'package:shoe_page_flutter/src/utils/Route.dart';
import 'package:shoe_page_flutter/src/viewmodel/ShopViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ShopViewModel()),

      ],
      child: MaterialApp(
        key: GlobalKey(), //
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.home,
        //routes: Routes.routes,
      ),
    );
  }
}

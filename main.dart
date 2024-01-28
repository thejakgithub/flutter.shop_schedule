import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_schedule/constants/app_constants.dart';
import 'package:shop_schedule/constants/routes.dart';
import 'package:shop_schedule/view_model/shop_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ShopProvider>(
            create: (context) => ShopProvider()),
      ],
      child: MaterialApp.router(
        title: 'Shop Schedule',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppConstant.redColor),
          useMaterial3: true,
        ),
        routeInformationProvider: router.routeInformationProvider,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
      ),
    );
  }
}

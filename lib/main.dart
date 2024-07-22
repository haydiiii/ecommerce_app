import 'package:ecommerce_app/core/services/dio_helper/dio_helper.dart';
import 'package:ecommerce_app/core/services/dio_helper/token.dart';
import 'package:ecommerce_app/features/splash/splash_view.dart';
import 'package:flutter/material.dart';

import 'core/services/dio_helper/cash_helper.dart';

void main() {
  
  WidgetsFlutterBinding.ensureInitialized();
  CashHelper.init();
  DioHelper.init();
  Token.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}

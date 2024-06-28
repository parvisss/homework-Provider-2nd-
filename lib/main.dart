import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_shop/controllers/card_controller.dart';
import 'package:online_shop/controllers/productc_controller.dart';
import 'package:online_shop/views/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(100, 300),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) {
              return ProductcController();
            },
          ),
          ChangeNotifierProvider(
            create: (context) {
              return CardController();
            },
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        ),
      ),
    );
  }
}

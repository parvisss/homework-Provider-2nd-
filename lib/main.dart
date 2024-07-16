import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_shop/core/main_app.dart';
import 'package:online_shop/firebase_options.dart';
import 'package:online_shop/logic/cubits/shop/product_cubit.dart';
import 'package:online_shop/repositories/product_repository.dart';
import 'package:online_shop/services/products_firebase_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(100, 300),
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (ctx) {
            return ProductRepository(ProductsFirebaseServices());
          })
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (ctx) {
              return ProductCubit(ctx.read<ProductRepository>());
            })
          ],
          child: const MainApp(),
        ),
      ),
    );
  }
}

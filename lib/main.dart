import 'package:aicha/views/authentication/forgot_password/forgot_password.dart';
import 'package:aicha/views/authentication/login/login.dart';
import 'package:aicha/views/authentication/register/register.dart';
import 'package:aicha/views/onboarding/start_shopping.dart';
import 'package:aicha/views/profile/home_page.dart';
import 'package:aicha/views/profile/pages/product_details.dart';
import 'package:aicha/views/profile/pages/products.dart';
import 'package:aicha/views/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //
  await Firebase.initializeApp(); //
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mg no gasp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/start_shopping', page: () => StartShoppingScreen()),
        GetPage(name: '/login', page: () => Login()),
        GetPage(name: '/forgot_password', page: () => FrogotPassword()),
        GetPage(name: '/register', page: () => Register()),
        GetPage(name: '/home', page: () => HomePageContent()),
        GetPage(name: '/products', page: () => Products()),
        GetPage(name: '/products_details', page: () => ProductDetails()),
      ],
      initialRoute: "/",
    );
  }
}

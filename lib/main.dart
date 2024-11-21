import 'package:flutter/material.dart';
import 'package:shopping_app/cart_provider.dart';
import 'package:shopping_app/home_screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) {
        return CartProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(seedColor:const Color.fromRGBO(254,206,1,1),primary:const Color.fromRGBO(254,206,1,1) ),
          inputDecorationTheme:const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1,)
          ),
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          )
          ),
        title: 'Figurine Stores',
        home:  const HomeScreen(),
      ),
    );
  }
}


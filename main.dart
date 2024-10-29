import 'package:flutter/material.dart';
import 'package:foodrecipe/providers/favorite_provider.dart';
import 'package:foodrecipe/screens/mainScreen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
    create: (_) => FavoriteProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,home:Mainscreen());
  }
}


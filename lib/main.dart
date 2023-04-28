import 'package:admin/store_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(
          colors: [
            Color(0xFF283855),
            Color(0xFF2E3F68),
            Color(0xFF3B5197),
          ],
        )),
        child: SplashScreenView(
          navigateRoute: const StoreList(),
          duration: 4500,
          imageSize: 450,
          // speed: 1000,
          pageRouteTransition: PageRouteTransition.SlideTransition,
          imageSrc: "assets/animation.gif",
          text: 'AquaGo Admin',
          textType: TextType.ColorizeAnimationText,
          textStyle: const TextStyle(
            fontSize: 40,
            letterSpacing: 4,
          ),
          colors: const [
            Color(0xFF1cd5e0),
            Color(0xFF000046),
          ],
          backgroundColor: Colors.transparent,
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Admin',
    );
  }
}

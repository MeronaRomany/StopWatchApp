import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stop_watch_app/provider/my_provider_app.dart';
import 'package:stop_watch_app/screens/first_page.dart';
import 'package:stop_watch_app/screens/second_page.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
      create: (context)=>MyProviderApp(),
      child: DevicePreview(
        enabled: true,
          builder: (context) =>const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

     initialRoute: "firstPage",
      routes: {
        "firstPage":(context)=> FirstPage(),
        "SecondPage":(context)=>SecondPage(),

      },
    );
  }
}


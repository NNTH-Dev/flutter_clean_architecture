import 'package:flutter_clean_architecture/core/routes/route.names.dart';
import 'package:flutter_clean_architecture/core/routes/routes.dart';
import 'package:flutter_clean_architecture/features/products/presentation/screens/home_screen.dart';
import 'package:flutter_clean_architecture/features/products/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

List<dynamic> providers = [];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...ProductProvider.provider],
      child: MaterialApp(
        title: 'Flutter Clean Architecture',
        debugShowCheckedModeBanner: kDebugMode,
        onGenerateRoute: Routes.generateRoute,
        initialRoute: RouteNames.homeScreen,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

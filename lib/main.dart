import 'package:amazon_clone_app/features/auth/screens/auth_screens.dart';
import 'package:amazon_clone_app/features/auth/services/auth_services.dart';
import 'package:amazon_clone_app/providers/user_provider.dart';
import 'package:amazon_clone_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/global_variables.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Clone App',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme:
            const ColorScheme.light(primary: GlobalVariables.secondaryColor),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      onGenerateRoute: ((settings) => generateRoute(settings)),
      home: const AuthScreen(),
    );
  }
}

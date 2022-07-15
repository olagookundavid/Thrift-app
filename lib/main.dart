import 'package:flutter/material.dart';
import 'package:thrift_project/local_storage/shared_preferences.dart';
import 'auth/login/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LoginSharedPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Thrift App',
      home: LoginPage(),
    );
  }
}

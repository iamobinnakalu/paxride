import 'package:flutter/material.dart';
import 'package:paxride/app.dart';
import 'package:paxride/provider/signUpNotifier.dart';
import 'package:paxride/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => SignUpNotifier()),
      ],
      child: MyApp(),
    ),
  );
}

import 'package:anonfess_mobile/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://eaueukjrstcklcczwufi.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVhdWV1a2pyc3Rja2xjY3p3dWZpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjY3NDM3OTksImV4cCI6MjA0MjMxOTc5OX0.HqUY6QZzvdX2n1v4nahNyw8X_MxKnPdUUyFNzpnYqqY',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: AuthGate(),
    );
  }
}

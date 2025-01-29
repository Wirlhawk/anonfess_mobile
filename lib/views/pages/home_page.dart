import 'package:anonfess_mobile/services/auth_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final String? email = _authService.getCurrentUser();

    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Text(email.toString()),
            TextButton(onPressed: _authService.signOut, child: Text("sign out"))
          ],
        ),
      ),
    );
  }
}

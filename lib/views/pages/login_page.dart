import 'package:anonfess_mobile/services/auth_service.dart';
import 'package:anonfess_mobile/style/style.dart';
import 'package:anonfess_mobile/views/components/neu_button.dart';
import 'package:anonfess_mobile/views/components/neu_card.dart';
import 'package:anonfess_mobile/views/components/text_input.dart';
import 'package:anonfess_mobile/views/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _authService = AuthService();

  final _emailController = TextEditingController();
  final _pwController = TextEditingController();

  void login() async {
    final email = _emailController.text;
    final password = _pwController.text;

    try {
      await _authService.signInWithEmailPassword(email, password);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Error: $e ")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: NeuCard(
              child: _buildLoginForm(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 15,
      children: [
        // Header title
        Text(
          "Login",
          style: GoogleFonts.lexend(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),

        // Enail input
        TextInput(
          label: "Email",
          placeholder: "email@gmail.com",
          controller: _emailController,
        ),

        // Password Input
        TextInput(
          label: "Password",
          placeholder: "******",
          obscureText: true,
          controller: _pwController,
        ),

        // Login Button
        NeuButton(
          label: "Login",
          onTap: login,
        ),

        const SizedBox(
          height: 10,
        ),

        // Register link
        Center(
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RegisterPage(),
              ),
            ),
            child: Text(
              "Register",
              style: GoogleFonts.lexend(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Style.secondary,
              ),
            ),
          ),
        )
      ],
    );
  }
}

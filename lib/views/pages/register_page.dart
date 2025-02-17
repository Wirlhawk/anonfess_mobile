import 'package:anonfess_mobile/services/auth_service.dart';
import 'package:anonfess_mobile/style/style.dart';
import 'package:anonfess_mobile/views/components/neu_button.dart';
import 'package:anonfess_mobile/views/components/neu_card.dart';
import 'package:anonfess_mobile/views/components/text_input.dart';
import 'package:anonfess_mobile/views/pages/home_page.dart';
import 'package:anonfess_mobile/views/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _authService = AuthService();

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _pwController = TextEditingController();

  void register(BuildContext context) async {
    final username = _usernameController.text;
    final email = _emailController.text;
    final password = _pwController.text;

    try {
      await _authService.signUpwithEmailPassword(
        username,
        email,
        password,
      );

      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomePage(),
      ));
    } catch (e) {
      if (mounted) {
        // ignore: use_build_context_synchronously
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
              child: _buildRegisterForm(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterForm(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 15,
      children: [
        // Header title
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 2,
          children: [
            Text(
              "Register",
              style: GoogleFonts.lexend(
                fontSize: 32,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              "Registrasi akun AnonFess anda",
              style: GoogleFonts.lexend(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Style.muted,
              ),
            ),
          ],
        ),

        SizedBox(
          height: 5,
        ),

        // Username
        TextInput(
          label: "Username",
          placeholder: "Username",
          controller: _usernameController,
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

        // Register Button
        NeuButton(
          label: "Register",
          onTap: () => register(context),
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
                builder: (context) => LoginPage(),
              ),
            ),
            child: Text(
              "Login",
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

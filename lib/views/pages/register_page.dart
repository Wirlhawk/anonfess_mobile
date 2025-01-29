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
  const RegisterPage({
    super.key,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _authService = AuthService();

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _pwController = TextEditingController();

  void register(BuildContext context) async {
    // ignore: unused_local_variable
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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: NeuCard(
            child: _buildRegisterForm(context),
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterForm(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          // Header title
          Text(
            "Register",
            style: GoogleFonts.lexend(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 10),

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
      ),
    );
  }
}

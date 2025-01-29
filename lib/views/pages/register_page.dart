import 'package:anonfess_mobile/style/style.dart';
import 'package:anonfess_mobile/views/components/neu_button.dart';
import 'package:anonfess_mobile/views/components/neu_card.dart';
import 'package:anonfess_mobile/views/components/text_input.dart';
import 'package:anonfess_mobile/views/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({
    super.key,
  });

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
          ),

          // Enail input
          TextInput(
            label: "Email",
            placeholder: "email@gmail.com",
          ),

          // Password Input
          TextInput(
            label: "Password",
            placeholder: "******",
          ),

          // Login Button
          NeuButton(label: "Login"),

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

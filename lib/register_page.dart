import 'package:chat_app/core/theme.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showInputValues() {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    print('Username: $username - Email : $email - password = $password');
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _TextInput(
                hint: 'Username',
                icon: Icons.person,
                controller: _usernameController,
              ),
              SizedBox(height: 20),
              _TextInput(
                hint: 'email',
                icon: Icons.person,
                controller: _emailController,
              ),
              SizedBox(height: 20),
              _TextInput(
                hint: 'Password',
                icon: Icons.person,
                controller: _passwordController,
                isPassword: true,
              ),
              SizedBox(height: 20),
              _RegisterButton(onPressed: _showInputValues),
              SizedBox(height: 20),
              _LoginPrompt(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TextInput extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final bool isPassword;

  const _TextInput({
    super.key,
    required this.hint,
    required this.icon,
    required this.controller,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DefaultColors.sentMessageInput,
        borderRadius: BorderRadius.circular(25),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: isPassword,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _RegisterButton extends StatelessWidget {
  final VoidCallback onPressed;
  const _RegisterButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: DefaultColors.buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(25),
        ),
        padding: EdgeInsets.symmetric(vertical: 15),
      ),
      child: Text('Register', style: TextStyle(color: Colors.white)),
    );
  }
}

class _LoginPrompt extends StatelessWidget {
  const _LoginPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: RichText(
          text: TextSpan(
            text: 'Already have account? ',
            style: TextStyle(color: Colors.grey),
            children: [
              TextSpan(
                text: 'Click here to login',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

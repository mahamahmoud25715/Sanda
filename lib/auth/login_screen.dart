import 'package:flutter/material.dart';
import 'package:sanad_app/auth/register_screen.dart';

class LoginScreen extends StatefulWidget {
  final bool isDark;
  final Function(bool) onThemeChanged;
  final String currentLang;
  final Function(String) onLangChanged;

  const LoginScreen({
    super.key,
    required this.isDark,
    required this.onThemeChanged,
    required this.currentLang,
    required this.onLangChanged,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;

  static const Color primaryColor = Color(0xFF102A43);
  static const Color accentColor = Color(0xFF179E79);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 100),

            Image.asset(
              'assets/images/sanad_logo.jpeg',
              width: 120,
            ),

            const SizedBox(height: 30),

            const Text(
              "تسجيل الدخول",
              style: TextStyle(
                color: primaryColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            TextField(
              decoration: InputDecoration(
                labelText: "البريد الإلكتروني",
                prefixIcon: const Icon(Icons.email_outlined,
                    color: accentColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              obscureText: _isObscure,
              decoration: InputDecoration(
                labelText: "كلمة المرور",
                prefixIcon: const Icon(Icons.lock_outline,
                    color: accentColor),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "دخول",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => RegisterScreen(
                      isDark: widget.isDark,
                      onThemeChanged: widget.onThemeChanged,
                      currentLang: widget.currentLang,
                      onLangChanged: widget.onLangChanged,
                    ),
                  ),
                );
              },
              child: const Text(
                "إنشاء حساب جديد",
                style: TextStyle(color: accentColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
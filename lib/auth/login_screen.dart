import 'package:flutter/material.dart';
import 'package:sanad1_app/auth/register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
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
            SizedBox(height: 100),
            Image.asset('assets/images/sanad_logo.jpeg', width: 120),
            SizedBox(height: 30),
            Text("تسجيل الدخول", style: TextStyle(color: primaryColor, fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 40),


            TextField(
              decoration: InputDecoration(
                labelText: "البريد الإلكتروني",
                prefixIcon: Icon(Icons.email_outlined, color: accentColor),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),

            SizedBox(height: 20),


            TextField(
              obscureText: _isObscure,
              decoration: InputDecoration(
                labelText: "كلمة المرور",
                prefixIcon: Icon(Icons.lock_outline, color: accentColor),


                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility_off : Icons.visibility,
                    color: primaryColor,
                  ),
                  onPressed: () {

                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),

            SizedBox(height: 30),


            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text("دخول", style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterScreen()));
              },
              child: Text("إنشاء حساب جديد", style: TextStyle(color: accentColor)),
            ),
          ],
        ),
      ),
    );
  }
}
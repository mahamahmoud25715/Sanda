import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sanad1_app/auth/register_screen.dart';
import 'package:sanad1_app/admin/admin_dashboard.dart';
=======
import 'package:sanad_app/auth/register_screen.dart';
>>>>>>> 2629d538c049cc46049e955c04477465729388a0

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
<<<<<<< HEAD
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isObscure = true;
=======

  bool _isObscure = true;

>>>>>>> 2629d538c049cc46049e955c04477465729388a0
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
<<<<<<< HEAD
            const SizedBox(height: 100),
            Image.asset('assets/images/sanad_logo.jpeg', width: 120),
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
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "البريد الإلكتروني",
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  color: accentColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _passwordController,
              obscureText: _isObscure,
              decoration: InputDecoration(
                labelText: "كلمة المرور",
                prefixIcon: const Icon(Icons.lock_outline, color: accentColor),
=======
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


>>>>>>> 2629d538c049cc46049e955c04477465729388a0
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility_off : Icons.visibility,
                    color: primaryColor,
                  ),
<<<<<<< HEAD
                  onPressed: () => setState(() => _isObscure = !_isObscure),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 30),
=======
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

>>>>>>> 2629d538c049cc46049e955c04477465729388a0

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
<<<<<<< HEAD
                onPressed: () async {
                  if (_emailController.text.isEmpty ||
                      _passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("برجاء إدخال البيانات")),
                    );
                    return;
                  }

                  try {
                    UserCredential userCredential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                        );

                    DocumentSnapshot userDoc = await FirebaseFirestore.instance
                        .collection('users')
                        .doc(userCredential.user!.uid)
                        .get();

                    if (userDoc.exists) {
                      String role = userDoc['role'];
                      if (role == 'مدير شركة') {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AdminDashboard(),
                          ),
                        );
                      } else {
                        print("هذا الحساب مسجل كمندوب");
                      }
                    }
                  } catch (e) {
                    print("خطأ في الدخول: $e");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("خطأ: ${e.toString()}"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "دخول",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
=======
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text("دخول", style: TextStyle(color: Colors.white, fontSize: 18)),
>>>>>>> 2629d538c049cc46049e955c04477465729388a0
              ),
            ),

            TextButton(
<<<<<<< HEAD
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => RegisterScreen()),
              ),
              child: const Text(
                "إنشاء حساب جديد",
                style: TextStyle(color: accentColor),
              ),
=======
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterScreen()));
              },
              child: Text("إنشاء حساب جديد", style: TextStyle(color: accentColor)),
>>>>>>> 2629d538c049cc46049e955c04477465729388a0
            ),
          ],
        ),
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 2629d538c049cc46049e955c04477465729388a0

import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sanad1_app/admin/admin_dashboard.dart';
=======
>>>>>>> 2629d538c049cc46049e955c04477465729388a0

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
<<<<<<< HEAD
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
=======
>>>>>>> 2629d538c049cc46049e955c04477465729388a0

  String? userRole;
  bool _isObscure = true;

<<<<<<< HEAD
  static const Color primaryColor = Color(0xFF102A43);
  static const Color accentColor = Color(0xFF179E79);

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

=======

  static const Color primaryColor = Color(0xFF102A43);
  static const Color accentColor = Color(0xFF179E79);

>>>>>>> 2629d538c049cc46049e955c04477465729388a0
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Text(
              "إنشاء حساب جديد",
              style: TextStyle(
                color: primaryColor,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),

<<<<<<< HEAD
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "الاسم بالكامل",
                prefixIcon: Icon(Icons.person_outline, color: accentColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
=======

            TextField(
              decoration: InputDecoration(
                labelText: "الاسم بالكامل",
                prefixIcon: Icon(Icons.person_outline, color: accentColor),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
>>>>>>> 2629d538c049cc46049e955c04477465729388a0
              ),
            ),
            SizedBox(height: 20),

<<<<<<< HEAD
            DropdownButtonFormField<String>(
=======

            DropdownButtonFormField<String>(

>>>>>>> 2629d538c049cc46049e955c04477465729388a0
              hint: Text("اختر نوع الحساب"),
              decoration: InputDecoration(
                labelText: "نوع الحساب",
                prefixIcon: Icon(Icons.badge_outlined, color: accentColor),
<<<<<<< HEAD
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
=======
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
>>>>>>> 2629d538c049cc46049e955c04477465729388a0
              ),
              items: ['مندوب', 'مدير شركة'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  userRole = newValue;
                });
              },
            ),
            SizedBox(height: 20),

<<<<<<< HEAD
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "البريد الإلكتروني",
                prefixIcon: Icon(Icons.email_outlined, color: accentColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
=======

            TextField(
              decoration: InputDecoration(
                labelText: "البريد الإلكتروني",
                prefixIcon: Icon(Icons.email_outlined, color: accentColor),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
>>>>>>> 2629d538c049cc46049e955c04477465729388a0
              ),
            ),
            SizedBox(height: 20),

<<<<<<< HEAD
            TextField(
              controller: _passwordController,
=======

            TextField(
>>>>>>> 2629d538c049cc46049e955c04477465729388a0
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
<<<<<<< HEAD
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
=======
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
>>>>>>> 2629d538c049cc46049e955c04477465729388a0
              ),
            ),

            SizedBox(height: 40),

<<<<<<< HEAD
=======

>>>>>>> 2629d538c049cc46049e955c04477465729388a0
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
<<<<<<< HEAD
                onPressed: () async {
                  if (_emailController.text.isEmpty ||
                      _passwordController.text.isEmpty ||
                      userRole == null) {
                    _showError("برجاء ملء جميع البيانات واختيار نوع الحساب");
                    return;
                  }

                  try {
                    UserCredential userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                        );

                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(userCredential.user!.uid)
                        .set({
                          'fullName': _nameController.text.trim(),
                          'email': _emailController.text.trim(),
                          'role': userRole,
                          'createdAt': DateTime.now(),
                        });

                    if (userRole == 'مدير شركة') {
                      print("تم تسجيل مدير بنجاح");
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => AdminDashboard()),
                      );
                    } else {
                      print("تم تسجيل مندوب بنجاح");
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      _showError("كلمة المرور ضعيفة جداً");
                    } else if (e.code == 'email-already-in-use') {
                      _showError("هذا البريد الإلكتروني مسجل بالفعل");
                    } else {
                      _showError(e.message ?? "حدث خطأ ما");
                    }
                  } catch (e) {
                    _showError("خطأ غير متوقع: $e");
                  }
=======
                onPressed: () {
                  // كود التسجيل مستقبلاً
>>>>>>> 2629d538c049cc46049e955c04477465729388a0
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "إنشاء حساب",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 20),
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

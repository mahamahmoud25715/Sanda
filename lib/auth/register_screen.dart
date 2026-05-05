import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  String? userRole;
  bool _isObscure = true;


  static const Color primaryColor = Color(0xFF102A43);
  static const Color accentColor = Color(0xFF179E79);

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


            TextField(
              decoration: InputDecoration(
                labelText: "الاسم بالكامل",
                prefixIcon: Icon(Icons.person_outline, color: accentColor),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 20),


            DropdownButtonFormField<String>(

              hint: Text("اختر نوع الحساب"),
              decoration: InputDecoration(
                labelText: "نوع الحساب",
                prefixIcon: Icon(Icons.badge_outlined, color: accentColor),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
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

            SizedBox(height: 40),


            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // كود التسجيل مستقبلاً
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
}
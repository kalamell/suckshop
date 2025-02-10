import 'package:appecommerce/screens/auth/login_screen.dart';
import 'package:appecommerce/screens/welcome_screen.dart';
import 'package:appecommerce/theme/theme.dart';
import 'package:appecommerce/widgets/custom_text_field.dart';
import 'package:appecommerce/widgets/gradient_button.dart';
import 'package:appecommerce/widgets/social_login_button.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: MediaQuery.of(context).size.height * 0.35,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: AppTheme.primaryGradient,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)
                    )
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: -50,
                        right: -50,
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.1)
                          ),
                        ),
                      ),
                      Positioned(
                        top: 48,
                        left: 16,
                        right: 16,
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.push(context,
                                MaterialPageRoute(builder: (context) => WelcomeScreen(),),
                              );
                              },
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "สมัครสมาชิก",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                              ),
                            ),
                            SizedBox(width: 40)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.20,
                left: 24,
                right: 24,
                child: Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: Offset(0, 10)
                      )
                    ]
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("สมัครสมาชิก",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          )
                        ),
                        SizedBox(height: 8,),
                        Text("กรุณากรอกข้อมูลเพื่อสมัครสมาชิก",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppTheme.textSecondary
                          )
                        ),
                        SizedBox(height: 32,),
                        CustomTextField(
                          label: "ชื่อ - นามสกุล", 
                          prefixIcon: Icons.person_outline,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if(value == null || value.isEmpty) {
                              return 'กรุณากรอกข้อมูล';
                            }
                            if (!value.contains('@')) {
                              return 'กรุณากรอกอีเมล';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 16,),
                        CustomTextField(
                          label: "อีเมล", 
                          prefixIcon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if(value == null || value.isEmpty) {
                              return 'กรุณากรอกข้อมูล';
                            }
                            if (!value.contains('@')) {
                              return 'กรุณากรอกอีเมล';
                            }
                            return null;
                          },
                        ),
                        
                        SizedBox(height: 16,),
                        CustomTextField(
                          label: "รหัสผ่าน", 
                          prefixIcon: Icons.lock_outline,
                          isPassword: true,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if(value == null || value.isEmpty) {
                              return 'กรุณากรอกข้อมูล';
                            }
                            if (value.length < 6) {
                              return 'กรอกรหัสผ่านขั้นต่ำ 6 ตัว';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16,),
                        CustomTextField(
                          label: "ยืนยันรหัสผ่าน", 
                          prefixIcon: Icons.lock_outline,
                          isPassword: true,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if(value == null || value.isEmpty) {
                              return 'กรุณากรอกข้อมูล';
                            }
                            if (value.length < 6) {
                              return 'กรอกรหัสผ่านขั้นต่ำ 6 ตัว';
                            }
                            return null;
                          },
                        ),
                        
                        SizedBox(height: 24,),
                        GradientButton(
                          text: "สมัครสมาชิก", 
                          onPressed: () {},
                        ),
                        SizedBox(height: 24,),
                        Center(
                          child: Text(
                            "หรือ",
                            style: TextStyle(
                              color: AppTheme.textSecondary,
                              fontSize: 14
                            )
                          ),
                        ),
                        SizedBox(height: 24,),
                        Row(
                          children: [
                            Expanded(
                              child: SocialLoginButton(
                                text: "Google", 
                                iconPath: 'assets/icons/google.png', 
                                onPressed: () {}),
                            ),
                            SizedBox(width: 16,),
                            Expanded(
                              child: SocialLoginButton(
                                text: "Apple", 
                                iconPath: 'assets/icons/apple.png', 
                                onPressed: () {}),
                            ),
                          ],
                        ),
                        SizedBox(height: 24,),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('เป็นสมาชิกอยู่แล้ว ?',
                                style: TextStyle(
                                  color: AppTheme.textSecondary
                                )
                              ),
                              TextButton(
                                onPressed: () {
                                   Navigator.push(context,
                                MaterialPageRoute(builder: (context) => LoginScreen(),),
                              );
                                }, 
                                child: Text(
                                  'คลิกที่นี่'
                                ))
                            ],
                          ),
                        )
                      
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),

        ),
      )
    );
  }
}
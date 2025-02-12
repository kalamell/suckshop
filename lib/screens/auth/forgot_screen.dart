import 'package:appecommerce/theme/theme.dart';
import 'package:appecommerce/widgets/custom_text_field.dart';
import 'package:appecommerce/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final _formKey = GlobalKey<FormState>();
  final _mobile = TextEditingController();
  bool _recoveryStarted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context), 
          icon: Icon(
            Icons.arrow_back_rounded,
            color: AppTheme.textSecondary,
          )
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ลืมรหัสผ่าน ?",
                  style: Theme.of(context).textTheme.displayLarge
              ),
              SizedBox(height: 8,),
              Text(
                "กรุณากรอกอีเมล เพื่อส่งการยืนยันการกู้คืน",
                style: TextStyle(
                  fontSize: 16,
                  color: AppTheme.textPrimary
                )
              ),
              SizedBox(height: 48,),
              if(!_recoveryStarted)
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      label: 'อีเมล', 
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      controller: _mobile,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'กรุณากรอกข้อมูล';
                        }
                        return null;
                        
                      },
                    ),
                    SizedBox(height: 24,),
                    GradientButton(
                      text: "ลืมรหัสผ่าน", 
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _recoveryStarted = true;
                          });
                        }
                      }
                    ),
                    SizedBox(height: 24,),
                    Center(
                      child: TextButton(
                        onPressed: () => Navigator.pop(context), 
                        child: Text(
                          "เข้าสู่ระบบ",
                          style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: 16
                          )
                        )
                      ),
                    )
                  ],
                ),
              )
              else 
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppTheme.success.withOpacity(0.1),
                        shape: BoxShape.circle
                      ),
                      child: Icon(
                          Icons.check_circle_outline,
                          size: 40,
                          color: AppTheme.success
                      )
                    ),
                    SizedBox(height: 24,),
                    Text(
                      "กรุณาตรวจสอบอีเมล",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    SizedBox(height: 16,),
                    Text(
                      "เราได้ทำการส่งลิ้งค์สำหรับการเปลี่ยนรหัสผ่าน ไปยังอีเมลที่ท่านระบุไว้เรียบร้อยแล้ว",
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 16,
                        height: 1.5
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24,),
                    GradientButton(
                      text: "เปิดอีเมล แอพพลิเคชั่น", 
                      onPressed: () {
                        
                      }
                    ),
                    SizedBox(height: 24,),
                    Center(
                      child: TextButton(
                        onPressed: () => Navigator.pop(context), 
                        child: Text(
                          "เข้าสู่ระบบ",
                          style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: 16
                          )
                        )
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
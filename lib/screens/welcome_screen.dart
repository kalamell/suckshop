import 'package:appecommerce/screens/auth/login_screen.dart';
import 'package:appecommerce/screens/auth/signup_screen.dart';
import 'package:appecommerce/theme/theme.dart';
import 'package:appecommerce/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage('assets/images/bkn.jpg'),
                fit: BoxFit.cover,
                opacity: 0.2
              )
            )
          ),
          SafeArea(child: Padding(padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Icon(
                        Icons.attractions_outlined,
                        size: 32,
                        color: AppTheme.primaryColor
                      ),
                    ),
                    SizedBox(width: 12,),
                    Text("Suck Shop",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold
                      )
                    )
                  ],
                ),
                SizedBox(height: 12,),
                Text("ค้นหา\nในแบบของคุณ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    height: 1.2
                )),
                SizedBox(height: 12,),
                Text("มันจะต้องมีสินค้าสักอันสิน่า ที่เหมาะกับคุณนะจ๊ะ ไม่ต้องรีบร้อนค่อย ๆ หาในแอพของเรา",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 1.5
                )),
                SizedBox(height: 48,),
                GradientButton(text: "เริ่มเลย",
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                  }
                ),

                SizedBox(height: 12,),
                Text(
                  "ฉันมีบัญชีผู้ใช้งานอยู่แล้ว",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 16,
                    height: 1.5,
                  )
                ),
                SizedBox(height: 12,),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      )
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    }, 
                    child: Text(
                      'เข้าสู่ระบบ', 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  ),
                ),
                SizedBox(height: 48,)
              ],
            ),
          ))
        ],
      )
    );
  }
}
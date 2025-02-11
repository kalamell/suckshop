import 'package:appecommerce/theme/theme.dart';
import 'package:appecommerce/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final int otpLength = 6;
  final List<TextEditingController> _controllers = [];
  final List<FocusNode> _focusNodes = [];

  bool _isVerifying =false;
  int _resendTimer = 30;
  bool _canResend = true;

  @override
  void initState() {
    super.initState();
    for(int i = 0; i < otpLength; i++) {
      _controllers.add(TextEditingController());
      _focusNodes.add(FocusNode());
    }
    _startResendTimer();
  }

  void _startResendTimer() {
    Future.delayed(Duration(seconds: 1), () {
      if(!mounted) return;
      setState(() {
        if(_resendTimer > 0) {
          _resendTimer--;
          _startResendTimer();
        } else {
          _canResend = true;
          _isVerifying = false;
        }

        
      });

      
    });
  }

  void _verifyOTP() {
    String otp = _controllers.map((controller) => controller.text).join();
    if(otp.length == otpLength) {
      setState(() => _isVerifying = true);
      Future.delayed(Duration(seconds: 2),() {
        if(!mounted) return;
      });
    }
  }

  @override
  void dispose() {
    for(var controller in _controllers) {
      controller.dispose();
    }
    for(var node in _focusNodes) {
      node.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          icon: Icon(
            Icons.arrow_back,
            color: AppTheme.textPrimary,
          ),
        )
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ยืนยันโทรศัพท์มือถือ",
                style: Theme.of(context).textTheme.displayLarge
              ),
              SizedBox(height: 8,),
              Text("Enter 6-digit code sent to +66 000 0000",
                style: TextStyle(
                  fontSize: 16,
                  color: AppTheme.textSecondary
                )
              ),
              SizedBox(height: 48,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(otpLength, (index) => SizedBox(
                    width: 50,
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      style: TextStyle(
                        fontSize: 24
                      ),
                      decoration: InputDecoration(
                        counterText: "",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: AppTheme.textSecondary.withOpacity(0.3)
                          )
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: AppTheme.primaryColor
                          ),
                        ),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          if(index < otpLength -1) {
                            _focusNodes[index+1].requestFocus();
                          } else {
                            _focusNodes[index].unfocus();
                            _verifyOTP();
                          }
                        } else if(index>0) {
                          _focusNodes[index-1].requestFocus();
                        }
                      },
                    ),
                  ),
                )
              ),
              SizedBox(height: 48,),
              GradientButton(
                text: _isVerifying ? "กำลังตรวจสอบ" : "ตรวจสอบ",
                onPressed: () {
                  if(_isVerifying) {
                    _verifyOTP();
                  }
                },
              ),
              SizedBox(height: 24,),
              Center(
                child: Column(
                  children: [
                    Text(
                      "ยังไม่ได้รับรหัสยืนยัน",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.textSecondary
                      )
                    ),
                    SizedBox(height: 8,),
                    TextButton(onPressed: _canResend ? (){
                      setState(() {
                        _canResend = false;
                        _resendTimer = 30;
                      }
                      );
                      _startResendTimer();
                    } : null, 
                      child: Text(
                        _canResend ? "ส่งอีกครั้ง" : "ส่งอีกครั้งภายใน ${_resendTimer}",
                        style: TextStyle(
                          color: _canResend ? AppTheme.primaryColor : AppTheme.textSecondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        )
                      )
                    )
                  ],
                ),
              )
            
            ],
          ),
        ),
      )
    );
  }
}
import 'dart:async';

import 'package:appecommerce/screens/onboarding_screen.dart';
import 'package:appecommerce/theme/theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  double _loadingProgress = 0.0;
  Timer? _progressTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500)
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0
    ).animate(
      CurvedAnimation(
        parent: _controller, 
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn)
      )
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0
    ).animate(
      CurvedAnimation(
        parent: _controller, 
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut)
      )
    );

    _controller.forward();

    _startLoadingProcess();

    Timer(const Duration(seconds: 3), () {
      if(mounted) {
        Navigator.push(context, MaterialPageRoute(builder: (content) => OnBoardingScreen() ));
      }

    },);


  }

  void _startLoadingProcess() {
    const totalSteps = 100;
    const stepDuration = Duration(milliseconds: 15);
    _progressTimer =  Timer.periodic(stepDuration, (timer) {
      setState(() {
        if (_loadingProgress < 1.0) {
          _loadingProgress+= 1 / totalSteps;
        } else  {
          _progressTimer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _progressTimer?.cancel();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppTheme.primaryGradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
        ),
        child: Stack(
          children: [
            Positioned(
              top: -100,
              right: -100,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.1)
                ),
              ),
            ),

            Positioned(
              top: 250,
              left: 10,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.1)
                ),
              ),
            ),

            Positioned(
              top: 400,
              right: 10,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.1)
                ),
              ),
            ),

            Positioned(
              bottom: -50,
              left: -50,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.1)
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _scaleAnimation.value,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Container(
                            padding: EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                )
                              ]
                            ),
                            child: Icon(
                              Icons.attractions_outlined,
                              size: 64,
                              color: AppTheme.primaryColor
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20,),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return FadeTransition(
                        opacity: _fadeAnimation,
                        child: const Column(
                          children: [
                            Text(
                              "SUCK SHOP",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text(
                              "เมื่อคุณช็อปของแพง นึกถึงเรา",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                                letterSpacing: 0.5,
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  ),
                  SizedBox(height: 48,),
                  SizedBox(
                    width: 200,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: _loadingProgress,
                            backgroundColor: Colors.white.withOpacity(0.2),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.white
                            ),
                            minHeight: 6,
                          ),
                        ),
                        SizedBox(height: 16,),
                        Text('${(_loadingProgress * 100).toInt()}%', 
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            )
          ],
        ),
      )
    );
  }
}
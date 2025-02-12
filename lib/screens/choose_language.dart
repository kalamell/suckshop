import 'package:appecommerce/theme/theme.dart';
import 'package:appecommerce/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({super.key});

  @override
  State<ChooseLanguage> createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  String? _selectedLanguage;

  final List<Map<String, String>> _languages = [
    {
      'code': 'en',
      'name': 'Endlish',
      'nativeName': 'English'
    },
    {
      'code': 'th',
      'name': 'Thailand',
      'nativeName': 'Thailand'
    }
  ];

  void _handleLanguageSelection() {
    if (_selectedLanguage != null) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: AppTheme.textPrimary
          )
        )
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "เลือกภาษาของท่าน",
                        style: Theme.of(context).textTheme.displayLarge
                      ),
                      SizedBox(height: 8,),
                      Text(
                        "กรุณาเลือกภาษาที่ท่านต้องการแสดงผล",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppTheme.textSecondary
                        ),
                      ),
                      SizedBox(height: 32,),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _languages.length,
                        itemBuilder: (context, index) {
                          final lang = _languages[index];
                          final isSelected = lang['code'] == _selectedLanguage;

                          return Container(
                            margin: EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: isSelected ? AppTheme.primaryColor : AppTheme.textSecondary.withOpacity(0.3),
                                width: isSelected ? 2 : 1,
                              ),
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedLanguage = lang['code'];
                                });
                              },
                              borderRadius: BorderRadius.circular(12),
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            lang['name']!,
                                            style: TextStyle(
                                              color: AppTheme.textPrimary,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600
                                            )
                                          ),
                                          SizedBox(height: 4,),
                                          Text(
                                            lang['nativeName']!,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: AppTheme.textSecondary

                                            )
                                          )
                                        ],
                                      )
                                    ),
                                    Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: isSelected ? AppTheme.primaryColor : AppTheme.textSecondary.withOpacity(0.3),
                                          width: 2
                                        )
                                      ),
                                      child: isSelected ? Container(
                                        margin: EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppTheme.primaryColor
                                        ),
                                      ) : null,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );

                        },
                      ),
                      SizedBox(height: 24,),
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: GradientButton(
                          text: "ยืนยัน",
                          onPressed:  _handleLanguageSelection,
                        ),
                      )
                    ],
                  ),
              ),
            ),
          )
        ],
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalapp/core/widgets/app_text_button.dart';
import 'package:medicalapp/core/widgets/app_text_form_field.dart';
import 'package:medicalapp/features/login/ui/widgets/dont_have_account_text.dart';
import 'package:medicalapp/features/login/ui/widgets/terms_and_conditions_text.dart';

import '../../../core/theming/Styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  bool isObsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Text("Welcome Back", style: TextStyles.font24BlueBold),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14GrayRegular,
                ),
                SizedBox(
                  height: 36.h,
                ),
                Form(
                    key: formkey,
                    child: Column(
                      children: [
                        AppTextFormField(
                          hintText: 'Email',
                          validator: (p0) {},
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        AppTextFormField(
                            hintText: 'Password',
                            validator: (p0) {},
                            isObscureText: isObsecureText,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isObsecureText = !isObsecureText;
                                });
                              },
                              child: isObsecureText
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                            )),
                        SizedBox(
                          height: 16.h,
                        ),
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Text('Forger Password?',
                              style: TextStyles.font12BlueRegular),
                        ),
                        SizedBox(
                          height: 46.h,
                        ),
                        AppTextButton(
                          buttonText: 'Login',
                          textStyle: TextStyles.font16WhiteSemiBold,
                          onPressed: () {},
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        const TermsAndConditionsText(),
                        SizedBox(height: 60.h),
                        const DontHaveAccountText(),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalapp/core/widgets/app_text_button.dart';
import 'package:medicalapp/core/widgets/app_text_form_field.dart';
import 'package:medicalapp/features/login/data/models/login_request_body.dart';
import 'package:medicalapp/features/login/ui/widgets/dont_have_account_text.dart';
import 'package:medicalapp/features/login/ui/widgets/email_and_password.dart';
import 'package:medicalapp/features/login/ui/widgets/login_cubit_listener.dart';
import 'package:medicalapp/features/login/ui/widgets/terms_and_conditions_text.dart';

import '../../../core/theming/Styles.dart';
import '../data/cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {



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
                Column(
                  children: [
                    EmailAndPassword(),
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
                      onPressed: () {validateThenDoLogin(context);},
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    const TermsAndConditionsText(),
                    SizedBox(height: 60.h),
                    const DontHaveAccountText(),
                    const LoginBlocListener()
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if(context.read<LoginCubit>().formkey.currentState!.validate()){
      context.read<LoginCubit>().emitLoginStates(LoginRequestBody(email: context.read<LoginCubit>().emailController.text , password: context.read<LoginCubit>().passwordController.text));
    }
  }
}

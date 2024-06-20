import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalapp/features/login/data/cubit/login_cubit.dart';

import '../../../../core/widgets/app_text_form_field.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObsecureText = true;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formkey,
        child: Column(
      children: [
        AppTextFormField(
          hintText: 'Email',
          controller: context.read<LoginCubit>().emailController,
          validator: (value) { if (value == null || value.isEmpty) {
            return 'Email cannot be empty';
          }
          const pattern = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$";
          final regex = RegExp(pattern);
          return !regex.hasMatch(value)
              ? 'Enter a valid email address'
              : null; },
        ),
        SizedBox(
          height: 16.h,
        ),
        AppTextFormField(
            hintText: 'Password',
            controller: context.read<LoginCubit>().passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password cannot be empty';
              } else if (value.length < 8) {
                return 'Password must be at least 8 characters long';
              } else if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
                return 'Password must contain at least one lowercase letter';
              } else if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
                return 'Password must contain at least one uppercase letter';
              } else if (!RegExp(r'(?=.*\d)').hasMatch(value)) {
                return 'Password must contain at least one number';
              } else if (!RegExp(r'(?=.*[@$!%*?&])').hasMatch(value)) {
                return 'Password must contain at least one special character';
              }
              return null;
            },
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
      ],
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalapp/core/theming/colors.dart';

import '../theming/Styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(

        obscureText: isObscureText ?? false,
        controller: controller,
        validator: (value) {

        },


        decoration: InputDecoration(

          fillColor: backgroundColor?? ColorsManager.moreLightGray,
          filled: true,
          suffixIcon: suffixIcon,

          hintStyle: hintStyle ?? TextStyles.font14LightGrayRegular,
          hintText: hintText,


          isDense: true,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          enabledBorder: enabledBorder ?? OutlineInputBorder(
              borderSide: BorderSide(
                  color: ColorsManager.lighterGray, width: 1.3),
              borderRadius: BorderRadius.circular(16)),
          focusedBorder: focusedBorder ?? OutlineInputBorder(
              borderSide: BorderSide(color: ColorsManager.mainBlue, width: 1.3),
              borderRadius: BorderRadius.circular(16)),
        ));
  }
}

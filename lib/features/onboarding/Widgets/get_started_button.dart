import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalapp/core/helpers/extensions.dart';

import '../../../core/routing/routes.dart';
import '../../../core/theming/Styles.dart';
import '../../../core/theming/colors.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      width: 311.w,

      child: TextButton(

        onPressed: () {
          context.pushNamed(Routes.loginScreen);

        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(ColorsManager.mainBlue),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: MaterialStateProperty.all(
            const Size(double.infinity, 52),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        child: Text(
          'Get Started',
          style: TextStyles.font16WhiteMedium,
        ),
      ),
    );
  }
}
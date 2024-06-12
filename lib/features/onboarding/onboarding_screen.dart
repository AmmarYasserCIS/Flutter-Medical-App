import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theming/Styles.dart';
import 'Widgets/doc_image_and_text.dart';
import 'Widgets/doc_logo_and_name.dart';
import 'Widgets/get_started_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 50.h, bottom: 30.h),
          child: Column(
            children: [
              DocLogoAndName(),
              SizedBox(
                height: 30.h,
              ),
              DocImageAndText(),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                    'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',style: TextStyles.font12GrayRegular,textAlign: TextAlign.center,maxLines: 2,),
              ),
              SizedBox(height: 32.h,),
              GetStartedButton(),
            ],
          ),
        ),
      )),
    );
  }
}

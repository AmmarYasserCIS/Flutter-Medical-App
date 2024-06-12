import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theming/Styles.dart';

class DocImageAndText extends StatelessWidget {
  const DocImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset('assets/svgs/docdoc_logo_low_opacity.svg'),
        Container(
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0.0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.14, 0.4])),
          child: Image.asset('assets/images/onboarding_doctor.png'),
        ),
        Positioned(
            right: 0,
            left: 0,
            bottom: 30,
            child: Text(
              "Best Doctor\nAppointment App",
              textAlign: TextAlign.center,style: TextStyles.font32BlueBold.copyWith(height: 1.4),
            ))
      ],
    );
  }
}

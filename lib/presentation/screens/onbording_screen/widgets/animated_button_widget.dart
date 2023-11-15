import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/theme/app_colors.dart';
import 'animated_text_widget.dart';

class AnimatedButtonWidget extends StatelessWidget {
  const AnimatedButtonWidget({
    super.key,
    required this.buttonDelayDuration,
    required this.buttonPlayDuration,
  });

  final Duration buttonDelayDuration;
  final Duration buttonPlayDuration;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned(
          child: Container(
            width: double.infinity,
            height: 70,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            decoration: BoxDecoration(
                color: AppColors.onBoardingButtonColor,
                borderRadius: BorderRadius.circular(50)),
            child: AnimatedTextWidget(
                buttonPlayDuration: buttonPlayDuration,
                buttonDelayDuration: buttonDelayDuration),
          ).animate().slideY(
                begin: 2,
                end: 0,
                delay: buttonDelayDuration,
                duration: buttonPlayDuration,
              ),
        )
      ],
    );
  }
}

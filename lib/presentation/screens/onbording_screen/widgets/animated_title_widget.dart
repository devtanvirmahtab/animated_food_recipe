import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/constants/strings_constants.dart';
import '../../../../core/theme/app_colors.dart';

class AnimatedTitleWidget extends StatelessWidget {
  const AnimatedTitleWidget({
    super.key,
    required this.titleDelayDuration,
    required this.mainPlayDuration,
  });

  final Duration titleDelayDuration;
  final Duration mainPlayDuration;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            style: Theme.of(context).textTheme.displaySmall,
            children: const [
              TextSpan(text: Strings.onBoardingTitle),
              TextSpan(
                  text: ' everyday',
                  style: TextStyle(color: AppColors.timeLineColor))
            ],
          ),
        )
            .animate()
            .slideY(
            begin: -0.2,
            end: 0,
            delay: titleDelayDuration,
            duration: mainPlayDuration,
            curve: Curves.easeInOutCubic)
            .scaleXY(
            begin: 0,
            end: 1,
            delay: titleDelayDuration,
            duration: mainPlayDuration,
            curve: Curves.easeInOutCubic),
      ),
    );
  }
}
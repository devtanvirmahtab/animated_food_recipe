import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/constants/strings_constants.dart';

class AnimatedDescriptionWidget extends StatelessWidget {
  const AnimatedDescriptionWidget({
    super.key,
    required this.descriptionPlayDuration,
    required this.descriptionDelayDuration,
  });

  final Duration descriptionPlayDuration;
  final Duration descriptionDelayDuration;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Text(
          Strings.onBoardingSlogan,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        )
            .animate()
            .slideY(
            begin: 0.1,
            end: 0,
            delay: 350.ms + 400.ms,
            duration: descriptionPlayDuration,
            curve: Curves.easeInOutCubic)
            .scaleXY(
            begin: 0,
            end: 1,
            delay: descriptionDelayDuration,
            duration: descriptionPlayDuration,
            curve: Curves.easeInOutCubic));
  }
}
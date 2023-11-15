import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/constants/assets_constants.dart';

class AnimatedDishWidget extends StatelessWidget {
  const AnimatedDishWidget({
    super.key,
    required this.dishPlayDuration,
    required this.leavesDelayDuration,
  });

  final Duration dishPlayDuration;
  final Duration leavesDelayDuration;

  @override
  Widget build(BuildContext context) {
    final leavesDelayDuration = 600.ms;
    final dishPlayDuration = 1000.ms;
    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          Positioned(
            // top: 300,
            left: 30,
            bottom: 0,
            child: Transform.rotate(
              angle: 2 * pi * 0.85,
              child: Image.asset(
                Assets.leaves,
                height: 200,
              ),
            ),
          )
              .animate()
              .scaleXY(
              delay: 1000.ms,
              begin: 0,
              end: 1,
              duration: 600.ms,
              curve: Curves.decelerate)
              .slide(begin: const Offset(0.7, -0.4), end: Offset.zero),
          Positioned(
            right: -100,
            top: 30,
            child: Image.asset(
              Assets.blackPepper,
              height: 140,
            ),
          )
              .animate()
              .scaleXY(
              delay: leavesDelayDuration - 200.ms,
              begin: 0,
              end: 1,
              duration: dishPlayDuration - 300.ms,
              curve: Curves.decelerate)
              .slide(begin: const Offset(0.7, -0.4), end: Offset.zero),
          Positioned(
            // top: 300,
            left: 0,
            bottom: -50,
            child: Transform.rotate(
              angle: 2 * pi * 0.85,
              child: Image.asset(
                Assets.leaves,
                height: 150,
              ),
            ),
          )
              .animate()
              .scaleXY(
              delay: leavesDelayDuration,
              begin: 0,
              end: 1,
              duration: dishPlayDuration,
              curve: Curves.decelerate)
              .slide(begin: const Offset(0.7, -0.4), end: Offset.zero),
          Positioned(
            // top: 10,
            right: 0,
            child: Transform.rotate(
              angle: 2 * pi * 0.45,
              child: Image.asset(
                Assets.leaves,
                height: 150,
              ),
            ),
          )
              .animate()
              .scaleXY(
              delay: leavesDelayDuration,
              begin: 0,
              end: 1,
              duration: dishPlayDuration,
              curve: Curves.decelerate)
              .slide(begin: const Offset(-0.7, 1), end: Offset.zero),
          Container(
            //margin: const EdgeInsets.only(top: 45),
            alignment: Alignment.topCenter,
            child: Image.asset(
              Assets.dish,
              fit: BoxFit.contain,
              height: 340,
            ),
          ).animate().scaleXY(
              begin: 0,
              end: 1,
              duration: dishPlayDuration,
              curve: Curves.easeInOutCubic),
        ],
      ),
    );
  }
}
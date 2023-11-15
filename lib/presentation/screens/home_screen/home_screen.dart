import 'package:animated_food_recipe/presentation/screens/home_screen/widgets/animatedNamedWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/constants/assets_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final avatarPlayDuration = 500.ms;
    final avatarWaitingDuration = 400.ms;
    final nameDelayDuration =
        avatarWaitingDuration + avatarWaitingDuration + 200.ms;
    final namePlayDuration = 800.ms;
    final categoryListPlayDuration = 750.ms;
    final categoryListDelayDuration =
        nameDelayDuration + namePlayDuration - 400.ms;
    final selectedCategoryPlayDuration = 400.ms;
    final selectedCategoryDelayDuration =
        categoryListDelayDuration + categoryListPlayDuration;

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              AnimatedNameWidget(
                namePlayDuration: namePlayDuration,
                nameDelayDuration: nameDelayDuration,
              ),
              Expanded(child: Container()),
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.blue.shade900,
                child: Image.asset(Assets.profileImage),
              )
                  .animate()
                  .scaleXY(
                    begin: 0,
                    end: 2,
                    duration: avatarPlayDuration,
                  )
                  .then(delay: avatarWaitingDuration)
                  .scaleXY(
                    begin: 3,
                    end: 1,
                  )
                  .slide(begin: Offset(-2, 2), end: Offset.zero)

              // .animate()
              // .scaleXY(
              // begin: 0,
              // end: 1,
              // duration: avatarPlayDuration,
              // curve: Curves.easeInOutSine)
              // .then(delay: avatarWaitingDuration)
              // .scaleXY(begin: 3, end: 1)
              // .slide(begin: const Offset(-1, 5), end: Offset.zero)
              ,
              const SizedBox(
                width: 25,
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          AnimatedCategoryList(
            categoryListPlayDuration: categoryListPlayDuration,
            categoryListDelayDuration: categoryListDelayDuration,
          ),
          const SizedBox(
            height: 30,
          ),
          AnimatedSelectedCategoryWidget(
            selectedCategoryPlayDuration: selectedCategoryPlayDuration,
            selectedCategoryDelayDuration: selectedCategoryDelayDuration,
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}

class AnimatedSelectedCategoryWidget extends StatelessWidget {
  final Duration selectedCategoryPlayDuration;
  final Duration selectedCategoryDelayDuration;
  const AnimatedSelectedCategoryWidget({
    Key? key,
    required this.selectedCategoryPlayDuration,
    required this.selectedCategoryDelayDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        "10 Recipes",
        style: Theme.of(context).textTheme.titleLarge,
      )
          .animate()
          .fadeIn(
          delay: selectedCategoryDelayDuration,
          duration: selectedCategoryPlayDuration,
          curve: Curves.decelerate)
          .slideX(begin: 0.2, end: 0),
    );
  }
}

class AnimatedCategoryList extends StatelessWidget {
  AnimatedCategoryList({
    super.key,
    required this.categoryListPlayDuration,
    required this.categoryListDelayDuration,
  });

  final Duration categoryListPlayDuration;
  final Duration categoryListDelayDuration;

  final _categories = const[
     FoodCategoryWidget(icon: "🔥", name: "Popular"),
    FoodCategoryWidget(icon: "🥦", name: "Healthy"),
    FoodCategoryWidget(icon: "🍲", name: "Soup"),
    FoodCategoryWidget(icon: "🍿", name: "Snacks"),
  ];

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 50,
        minHeight: 40,
      ),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 15),
        children:
            List.generate(_categories.length, (index) => _categories[index],)
                .animate(interval: 100.ms, delay: categoryListDelayDuration)
                .slideX(
                    duration: categoryListPlayDuration,
                    begin: 5,
                    end: 0,
                    curve: Curves.easeInOutSine),
      ),
    );
  }
}

class FoodCategoryWidget extends StatelessWidget {
  final String icon;
  final String name;

  const FoodCategoryWidget({
    Key? key,
    required this.icon,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white30, width: 2),
        borderRadius: BorderRadius.circular(25),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            icon,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}

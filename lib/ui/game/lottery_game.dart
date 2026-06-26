import 'package:dsx_app/controller/shuffle/shuffle_controller.dart';
import 'package:dsx_app/controller/theme/theme_controller.dart';
import 'package:dsx_app/components/buttons/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LotteryGame extends StatelessWidget {
  const LotteryGame({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        return GetBuilder<ShuffleController>(
          builder: (controller) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Lottary Game"),
              ),
              body: Center(
                child: Column(
                  spacing: 4,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      transitionBuilder: (child, anim) =>
                          ScaleTransition(scale: anim, child: child),
                      child: Text(
                        '${controller.currentNumber}',
                        key: ValueKey(controller.currentNumber),
                        style: const TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (controller.status.isNotEmpty) Text(controller.status),
                    Text("${controller.currentNumber}"),
                    const SizedBox(height: 18),
                    Text("Total Score: ${controller.total}"),
                    Text("Chances Left: ${3 - controller.zeroCount}"),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
              floatingActionButton: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: CustomButton(
                    title: controller.status.isEmpty
                        ? "Shuffle"
                        : controller.status.contains("lost")
                            ? "Try Again"
                            : "Start New Game",
                    onTap: controller.isShuffling
                        ? null
                        : () {
                            controller.status.isEmpty
                                ? controller.startShuffling()
                                : controller.resetGame();
                          },
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

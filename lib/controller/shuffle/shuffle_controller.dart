import 'dart:async';
import 'dart:math';
import 'package:get/get.dart';

class ShuffleController extends GetxController {
  final _random = Random();
  StreamSubscription? _subscription;

  int currentNumber = 1;
  bool isShuffling = false;
  int total = 0;
  int zeroCount = 0;
  String status = "";

  void startShuffling() async {
    if (isShuffling) return;

    isShuffling = true;
    update();

    final stream = Stream.periodic(const Duration(milliseconds: 100), (_) {
      return _random.nextInt(6);
    });

    _subscription = stream.listen((number) {
      currentNumber = number;
      update();
    });

    // Shuffle for 2 seconds
    await Future.delayed(const Duration(seconds: 2));

    await stopShuffling();
  }

  Future<void> stopShuffling() async {
    if (_subscription != null) {
      await _subscription!.cancel();
      _subscription = null;
    }

    isShuffling = false;
    final number = currentNumber;
    total += number;
    if (number == 0) {
      zeroCount += 1;
    }

    if (total >= 100) {
      status = "Success 🎉";
    } else if (zeroCount >= 3) {
      status = "You lost. Try again 😢";
    }

    update();
  }

  void resetGame() {
    currentNumber = 1;
    isShuffling = false;
    total = 0;
    zeroCount = 0;
    status = "";
    update();
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }
}

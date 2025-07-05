import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'shuffle_event.dart';
import 'shuffle_state.dart';

class ShuffleBloc extends Bloc<ShuffleEvent, ShuffleState> {
  final _random = Random();

  ShuffleBloc() : super(ShuffleState(currentNumber: 1, total: 0)) {
    on<StartShuffling>(_onStartShuffling);
    on<StopShuffling>(_onStopShuffling);
    on<ResetShuffle> (_onResetGame);
  }

  Future<void> _onStartShuffling(
      StartShuffling event, Emitter<ShuffleState> emit) async {
    emit(state.copyWith(isShuffling: true));

    final stream = Stream.periodic(Duration(milliseconds: 100), (_) {
      return _random.nextInt(6) ;
    });

    final subscription = stream.listen((number) {

     if (!emit.isDone) {
        emit(state.copyWith(currentNumber: number));
      }
    });

    // Shuffle for 2 seconds
    await Future.delayed(Duration(seconds: 2));

    await subscription.cancel(); // stop emitting
    add(StopShuffling());
  }

  Future<void> _onStopShuffling(
    StopShuffling event, Emitter<ShuffleState> emit) async {
  final number = state.currentNumber;
  final newTotal = state.total + number;
  final newZeroCount = number == 0 ? state.zeroCount + 1 : state.zeroCount;

  String newStatus = "";

  if (newTotal >= 100) {
    newStatus = "Success 🎉";
  } else if (newZeroCount >= 3) {
    newStatus = "You lost. Try again 😢";
  }

  emit(state.copyWith(
    isShuffling: false,
    total: newTotal,
    zeroCount: newZeroCount,
    status: newStatus,
  ));
}
Future<void> _onResetGame(ResetShuffle event, Emitter<ShuffleState> emit) async {
  emit(ShuffleState(currentNumber: 1)); // resets everything
}}
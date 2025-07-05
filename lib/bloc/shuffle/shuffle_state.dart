class ShuffleState {
  final int currentNumber;
  final bool isShuffling;
  final int total;
  final int zeroCount;
  final String status;

  ShuffleState({
    required this.currentNumber,
    this.isShuffling = false,
    this.total = 0,
    this.zeroCount = 0,
    this.status = "",
  });

  ShuffleState copyWith({
    int? currentNumber,
    bool? isShuffling,
    int? total,
    int? zeroCount,
    String? status,
  }) {
    return ShuffleState(
      currentNumber: currentNumber ?? this.currentNumber,
      isShuffling: isShuffling ?? this.isShuffling,
      total: total ?? this.total,
      zeroCount: zeroCount ?? this.zeroCount,
      status: status ?? this.status,
    );
  }
}

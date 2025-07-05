abstract class ShuffleEvent {}

class StartShuffling extends ShuffleEvent{}
class StopShuffling extends ShuffleEvent{}
class ResetShuffle extends ShuffleEvent{}
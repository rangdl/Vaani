enum PlayStatus { stopped, playing, paused, hidden, loading, completed }

class PlayerStatus {
  PlayStatus playStatus;
  String itemId;
  bool quite;

  PlayerStatus({
    this.playStatus = PlayStatus.hidden,
    this.itemId = '',
    this.quite = false,
  }) {
    // addListener(_onStatusChanged);
  }
  bool isPlaying({String? itemId}) {
    if (itemId != null && this.itemId.isNotEmpty) {
      return playStatus == PlayStatus.playing && this.itemId == itemId;
    } else {
      return playStatus == PlayStatus.playing;
    }
  }

  bool isPaused({String? itemId}) {
    if (itemId != null && this.itemId.isNotEmpty) {
      return playStatus == PlayStatus.paused && this.itemId == itemId;
    } else {
      return playStatus == PlayStatus.paused;
    }
  }

  bool isStopped({String? itemId}) {
    if (itemId != null && this.itemId.isNotEmpty) {
      return playStatus == PlayStatus.stopped && this.itemId == itemId;
    } else {
      return playStatus == PlayStatus.stopped;
    }
  }

  bool isLoading(String? itemId) {
    if (itemId != null && this.itemId.isNotEmpty) {
      return playStatus == PlayStatus.loading && this.itemId == itemId;
    } else {
      return playStatus == PlayStatus.loading;
    }
  }

  PlayerStatus copyWith({
    PlayStatus? playStatus,
    String? itemId,
    bool? quite,
  }) {
    return PlayerStatus(
      playStatus: playStatus ?? this.playStatus,
      itemId: itemId ?? this.itemId,
      quite: quite ?? this.quite,
    );
  }
}

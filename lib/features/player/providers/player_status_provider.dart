// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:vaani/features/player/core/player_status.dart' as core;

// part 'player_status_provider.g.dart';

// @Riverpod(keepAlive: true)
// class PlayerStatus extends _$PlayerStatus {
//   @override
//   core.PlayerStatus build() {
//     return core.PlayerStatus();
//   }

//   void setPlayStatus(core.PlayStatus playStatus) {
//     state = state.copyWith(playStatus: playStatus);
//   }

//   void setPlayStatusQuietly(core.PlayStatus playStatus) {
//     // state.copyWith(quite: true);
//     setPlayStatus(playStatus);
//     // state.copyWith(quite: false);
//   }

//   // 校验原值, 不相同则更新
//   void setPlayStatusVerify(core.PlayStatus playStatus) {
//     if (state.playStatus != playStatus) {
//       setPlayStatus(playStatus);
//     }
//   }

//   void setLoading(String itemId) {
//     state = state.copyWith(
//       playStatus: core.PlayStatus.loading,
//       itemId: itemId,
//     );
//   }

//   void setHidden() {
//     state = state.copyWith(playStatus: core.PlayStatus.hidden);
//   }
// }

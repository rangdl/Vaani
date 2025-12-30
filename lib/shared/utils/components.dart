import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/widgets.dart';
import 'package:vaani/generated/l10n.dart';

class Components {
  Components._();
  static ClassicHeader easyRefreshHeader(BuildContext context) {
    return ClassicHeader(
      dragText: S.of(context).erDragText,
      armedText: S.of(context).erArmedText,
      readyText: S.of(context).erReadyText,
      processingText: S.of(context).erProcessingText,
      processedText: S.of(context).erProcessedText,
      noMoreText: S.of(context).erNoMoreText,
      failedText: S.of(context).erFailedText,
      messageText: S.of(context).erMessageText,
    );
  }

  static ClassicFooter easyRefreshFooter(BuildContext context) {
    return ClassicFooter(
      dragText: S.of(context).erDragTextUp,
      armedText: S.of(context).erArmedText,
      readyText: S.of(context).erReadyText,
      processingText: S.of(context).erProcessingText,
      processedText: S.of(context).erProcessedText,
      noMoreText: S.of(context).erNoMoreText,
      failedText: S.of(context).erFailedText,
      messageText: S.of(context).erMessageText,
      infiniteOffset: 0,
    );
  }
}

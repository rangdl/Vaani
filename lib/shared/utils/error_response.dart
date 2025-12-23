import 'package:logging/logging.dart';
import 'package:shelfsdk/audiobookshelf_api.dart';
import 'package:vaani/shared/extensions/obfuscation.dart';

final _logger = Logger('ErrorResponse');

class ErrorResponseHandler {
  String? name;
  ApiResponse _response;
  bool logRawResponse;

  ErrorResponseHandler({
    this.name,
    dynamic response,
    this.logRawResponse = false,
  }) : _response = response ?? BaseResponse(418, '');

  void storeError(ApiResponse response, [Object? error]) {
    if (logRawResponse) {
      _logger.severe('for $name got response: ${response.obfuscate()}');
    }
    _response = response;
  }

  ApiResponse get response => _response;
}

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class ThirdPartyServicesModule {
  @lazySingleton
  Logger get logger => Logger(level: kReleaseMode ? Level.error : Logger.level);
}

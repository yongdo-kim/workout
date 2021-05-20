// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i3;

import '../../services/shop_service.dart' as _i4;
import '../../services/third_party_module.dart' as _i7;
import '../../services/user_service.dart' as _i5;
import '../../services/work_service.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<_i3.Logger>(() => thirdPartyServicesModule.logger);
  gh.singleton<_i4.ShopService>(_i4.ShopService());
  gh.singleton<_i5.UserService>(_i5.UserService());
  gh.singleton<_i6.WorkOutService>(_i6.WorkOutService());
  return get;
}

class _$ThirdPartyServicesModule extends _i7.ThirdPartyServicesModule {}

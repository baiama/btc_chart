import 'dart:async';

import 'package:btc_chart/logic/api/api.dart';
import 'package:dio/dio.dart';

const String _baseUrl = "https://app.independentreserve.com/apim/";
// market/chart?model.range=1d&model.primary=Xbt&model.secondary=Aud"

class BTCApi extends ApiMap {
  @override
  FutureOr<BaseOptions> getOptions() {
    var options = BaseOptions(
      baseUrl: _baseUrl,
    );
    options.headers['x-mobile-version'] = '0.1';
    return options;
  }
}

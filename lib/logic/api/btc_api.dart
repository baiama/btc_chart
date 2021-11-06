import 'dart:async';

import 'package:btc_chart/logic/api/api.dart';
import 'package:btc_chart/logic/models/btc_model.dart';
import 'package:btc_chart/logic/models/http/response_helper.dart';
import 'package:dio/dio.dart';

const String _baseUrl = "https://app.independentreserve.com/apim/";

class BTCApi extends ApiMap {
  //Set base url and header for requests
  @override
  FutureOr<BaseOptions> getOptions() {
    var options = BaseOptions(
      baseUrl: _baseUrl,
    );
    options.headers['x-mobile-version'] = '0.1';
    return options;
  }

  Future<ResponseData<BTCModel>> getBTCData() async {
    try {
      var client = await getClient();
      Response res = await client.get(
          'market/chart?model.range=1d&model.primary=Xbt&model.secondary=Aud');
      client.close();
      return ResponseData(data: BTCModel.fromJson(res.data), error: null);
    } on DioError catch (e) {
      return ResponseData(data: null, error: e.toString());
    }
  }
}

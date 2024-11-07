import 'dart:developer';

import 'package:pockemon_r/ui/data/networking/api_endpoints.dart';
import 'package:pockemon_r/ui/data/networking/dio_client.dart';

class PockemonRepo {
  final DioClient _dioClient = DioClient();
  Future getPockemonList() async {
    final response = await _dioClient.get(ApiEndpoints.baseUrl);
    log(response.data.toString());
  }
}

class Pockemon {
  final DioClient _dioClient = DioClient();
  Future getfavPokemon() async {
    final response = await _dioClient.get(ApiEndpoints.baseUrl);
    log(response.data.toString());
  }
}

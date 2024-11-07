import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pockemon_r/ui/data/models/pockemon.dart';
import 'package:pockemon_r/ui/data/networking/api_endpoints.dart';
import 'package:pockemon_r/ui/data/networking/dio_client.dart';

class PockemonRepo {
  final DioClient _dioClient = DioClient();
  Future<List<Pokemon>> getPockemonList() async {
    final Response = await _dioClient.get(ApiEndpoints.baseUrl);
    if (Response.statusCode == 200) {
      final List<Pokemon> pockemonList = [];
      final decodeData = jsonDecode(Response.data);
      decodeData.forEach((pockemon) {
        pockemonList.add(Pokemon.fromJson(pockemon));
      });
      log(pockemonList.length.toString());
      return pockemonList;
    } else {
      log('Failed to fetch pockemon list');
      return [];
    }
  }
}

final pockemonProvider = Provider((ref) => PockemonRepo());

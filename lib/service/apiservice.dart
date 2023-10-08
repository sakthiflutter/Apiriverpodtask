import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../models/listrepomodels.dart';
import 'package:http/http.dart' as http;
final repoprovider= Provider<ApiServices>((ref)=>ApiServices());
class ApiServices{
  String baseurl = 'https://api.github.com/search/repositories?q=created:>2022-04-29&sort=stars&order=desc';
  Future<Repomodeldata> getRepo() async {
    var response = await http.get(Uri.parse(baseurl));
    if (response.statusCode == 200){
      Repomodeldata kk=  repomodeldataFromJson(response.body);

      return repomodeldataFromJson(response.body);
    }else {
      throw Exception(response.reasonPhrase);
    }
  }
}


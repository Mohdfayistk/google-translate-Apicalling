import 'dart:convert';


import 'package:http/http.dart';




import '../modelclass/translate.dart';
import 'api_client.dart';




class MovieApi {
  ApiClient apiClient = ApiClient();


  Future<Translate> getMovie() async {
    String trendingpath = 'https://google-translate1.p.rapidapi.com/language/translate/v2/detect';
    var body = {
'q':'Hello, world!',
      'target':'ml',
      'source':'en',
    };
    Response response = await apiClient.invokeAPI(trendingpath, 'POST', body);

    return Translate.fromJson(jsonDecode(response.body));
  }
}
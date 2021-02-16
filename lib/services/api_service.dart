import 'dart:convert';
import 'package:news_app/model/article_model.dart';
import 'package:http/http.dart';

///make the HTTP request services
///this class will allow us to make a simple get http request
///from the API and get the articles and then return a list of articles

class ApiService {
  ///add endpoint URL, you can check the webste doc
  ///and learn about different endpoints
  ///use single endpoint

  ///use ur own API key
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=c035074da07b49409993631d22dba5dc";

  ///create http request function
  ///but first import the http package
  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);

    ///check if we got a 200 status code: means that the request was successfull
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];

      ///this line will allow us to get the different articles from the json file
      ///and putting them into a list
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}

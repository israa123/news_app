import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/models/article_model.dart';

// make the http Request services
//this class will alows us to make a simple get http request
//from the API and get the Articles and then return a list of Articles
class ApiService {
  //add an Endpoint URL

  final endPointUrl =
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=48f13e66899346f7a948622e0d7aae2a';
//create the http request function but first import the http package
  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);
    //check 200 status code :this mean that request was a success
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
//this line will allow us to get the diffrent articles from the json and putting them into a list
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("can't get the Articles");
    }
  }
}

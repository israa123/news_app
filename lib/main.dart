import 'package:flutter/material.dart';
import 'package:news_app/componentes/custom_list_tile.dart';

import 'models/article_model.dart';
import 'services/api_service.dart';

void main() {
  runApp(MyHome());
}

class MyHome extends StatefulWidget {
  MyHome({Key key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

class Home extends StatelessWidget {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News App",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      //call the Api services with futurebuilder widget
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          //check if we got a response or not
          if (snapshot.hasData) {
            //make alist of articles
            List<Article> articles = snapshot.data;
            return ListView.builder(
              // create our custom List tile
              itemCount: articles.length,

              itemBuilder: (context, index) =>
                  customListTile(articles[index], context),
            );
            //listTile(title:Text(articles[index].title),),);

          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

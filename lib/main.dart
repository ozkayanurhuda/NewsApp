import 'package:flutter/material.dart';
import 'package:news_app/components/customListTile.dart';
import 'package:news_app/services/api_service.dart';
import 'model/article_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///make the HTTP request services this class will allow us to make a simple
  ///get http request from the API and get the articles and then return a list of articles
  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HABERLER",
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 0.8,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Colors.orange[800],
        centerTitle: true,
      ),

      ///call the API services with futurebuilder widget
      ///get http request
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          ///check if we got a response or not

          if (snapshot.hasData) {
            List<Article> articles = snapshot.data;
            return ListView.builder(
              ///create our custom list tile

              itemCount: articles.length,
              itemBuilder: (context, index) =>
                  customListTile(articles[index], context),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      backgroundColor: Colors.indigo[50],
    );
  }
}

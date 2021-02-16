import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';

///create the article details
///

class ArticlePage extends StatelessWidget {
  final Article article;
  ArticlePage({this.article});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          article.title,
          style: TextStyle(
            fontSize: 22.0,
          ),
        ),
        backgroundColor: Colors.orange[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///for image of the news
            Container(
              ///when i add these then i see the pics
              height: 250.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(article.urlToImage),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(14.0),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),

            ///for address of the article
            Row(
              children: [
                Text(
                  article.publishedAt.substring(0, 10),
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: Colors.blueGrey,
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(2.5),
                  decoration: BoxDecoration(
                    color: Colors.orange[800],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    article.source.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),

            ///for article description
            Text(
              article.description,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}

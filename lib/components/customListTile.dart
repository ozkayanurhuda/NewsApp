import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/pages/articles_details_page.dart';

Widget customListTile(Article article, BuildContext context) {
  return InkWell(
    ///Navigate to article page
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePage(
                    article: article,
                  )));
    },

    child: Container(
      margin: EdgeInsets.all(13.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 3.0,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            ///when i add these then i see the pics
            height: 200.0,
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
            height: 8.0,
          ),
          Text(
            article.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            children: [
              Spacer(),
              Container(
                padding: EdgeInsets.all(2.5),
                alignment: Alignment.bottomRight,
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
            height: 8.0,
          ),
        ],
      ),
    ),
  );
}

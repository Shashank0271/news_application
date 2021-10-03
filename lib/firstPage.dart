import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news/ArticleView.dart';
import 'package:news/loadingScreen.dart';

class FirstPage extends StatefulWidget {
  final decodedStuff;
  FirstPage(this.decodedStuff);
  @override
  _FirstPageState createState() => _FirstPageState();
}

const List categoriesTitles = [
  'business',
  'entertainment',
  'general',
  'health',
  'science',
  'sports',
  'technology'
];

class _FirstPageState extends State<FirstPage> {
  var data;
  @override
  void initState() {
    super.initState();
    data = widget.decodedStuff;
  }

  @override
  void deactivate() {
    super.deactivate();
    SystemNavigator.pop(); //to exit app
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.pageview_rounded,
          color: Colors.lightBlueAccent,
          size: 45,
        ),
        elevation: 5.0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              'Up',
              style: TextStyle(
                color: Colors.lightBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Date',
              style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            Material(
              elevation: 5.0,
              child: Container(
                height: 70,
                child: ListView.builder(
                  itemCount: categoriesTitles.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoadingScreen(
                                    'https://newsapi.org/v2/top-headlines?country=in&category=${categoriesTitles[index]}&apiKey=6dd4829f4a4c4039b96fcc22a7ae841e')));
                      },
                      child: Container(
                        margin: EdgeInsets.all(7),
                        width: 125,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.lightBlueAccent.shade100,
                        ),
                        child: Center(
                          child: Text(
                            categoriesTitles[index],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        data['articles'][index]['url'] != null
                            ? Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                return ArticleV(
                                  passedUrl: data['articles'][index]['url'],
                                );
                              }))
                            : print("hello");
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 16),
                        // width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              child:
                                  data['articles'][index]['urlToImage'] != null
                                      ? Image(
                                          image: NetworkImage(data['articles']
                                              [index]['urlToImage']),
                                          fit: BoxFit.cover,
                                        )
                                      : Container(
                                          child: Center(
                                              child: Text(
                                            "No image available",
                                            style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                            ),
                                          )),
                                          margin: EdgeInsets.all(20),
                                        ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            Text(
                              data['articles'][index]['title'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

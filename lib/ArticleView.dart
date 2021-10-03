import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleV extends StatelessWidget {
  final String passedUrl;
  ArticleV({@required this.passedUrl});
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
              'Find',
              style: TextStyle(
                color: Colors.lightBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'News',
              style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: WebView(
          initialUrl: passedUrl,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}

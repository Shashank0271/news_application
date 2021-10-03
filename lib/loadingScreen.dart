import 'package:flutter/material.dart';
import 'package:news/firstPage.dart';
import 'package:news/networkHelper.dart';

class LoadingScreen extends StatefulWidget {
  final String loadingUrl;
  LoadingScreen(this.loadingUrl);
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getEverythingDataFromNetworkHelperAndOpenFirstPage(String useUrl) async {
    NetworkHelper networkHelper = NetworkHelper(useUrl);
    var decodedStuff = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return FirstPage(decodedStuff);
    }));
  }

  @override
  void initState() {
    ///using the NetworkHelper class decode url with top-headlines endpoint
    ///pass the decoded data to the stateful widget FirstPage.
    getEverythingDataFromNetworkHelperAndOpenFirstPage(widget.loadingUrl);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.grey.shade100,
          strokeWidth: 5,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
 
 
class WebViewLoad extends StatefulWidget {
  String url;
  WebViewLoad(this.url);
  WebViewLoadUI createState() => WebViewLoadUI(url);
 
}
 
class WebViewLoadUI extends State<WebViewLoad>{
  String url;
  WebViewLoadUI(this.url);
  
  @override
  Widget build(BuildContext context) {
  return Scaffold(
     appBar: AppBar(
        title: Text('WebView in APeye')),
    body: WebView(
      initialUrl: url,
      javascriptMode: JavascriptMode.unrestricted,
 
    )
  );
  }
}
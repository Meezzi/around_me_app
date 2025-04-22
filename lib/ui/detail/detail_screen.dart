import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class DetailScreen extends StatelessWidget {
  final String link;

  const DetailScreen(this.link, {super.key});

  @override
  Widget build(BuildContext context) {
    return InAppWebView(initialUrlRequest: URLRequest(url: WebUri(link)));
  }
}

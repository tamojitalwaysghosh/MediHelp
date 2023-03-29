import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Blogs3Screen extends StatefulWidget {
  const Blogs3Screen({super.key});

  @override
  State<Blogs3Screen> createState() => _Blogs3ScreenState();
}

class _Blogs3ScreenState extends State<Blogs3Screen> {
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..loadRequest(Uri.parse(
        'https://www.nationwide.com/lc/resources/home/articles/senior-citizen-safety'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Health Tips for the aged')),
      body: WebViewWidget(controller: controller),
    );
  }
}

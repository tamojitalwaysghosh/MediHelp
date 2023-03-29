import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Blogs1Screen extends StatefulWidget {
  const Blogs1Screen({super.key});

  @override
  State<Blogs1Screen> createState() => _Blogs1ScreenState();
}

class _Blogs1ScreenState extends State<Blogs1Screen> {
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..loadRequest(Uri.parse(
        'https://www.nebraskamed.com/primary-care/10-tips-to-keep-your-child-healthy-this-school-year'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Health Tips for middle aged')),
      body: WebViewWidget(controller: controller),
    );
  }
}

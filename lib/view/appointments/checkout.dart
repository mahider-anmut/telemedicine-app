import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CheckoutPage extends StatefulWidget {
  final String checkoutUrl;
  final String successUrl;

  const CheckoutPage({
    Key? key,
    required this.checkoutUrl,
    required this.successUrl,
  }) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(widget.successUrl)) {
              Navigator.of(context).pop(); // Close the WebView
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.checkoutUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('Complete Payment')),
      body: WebViewWidget(controller: _controller),
    );
  }
}

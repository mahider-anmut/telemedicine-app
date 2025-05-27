import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';  // For Android-specific params

class VideoCallPage extends StatefulWidget {
  final String url;

  const VideoCallPage({
    super.key,
    required this.url,
  });

  @override
  _VideoCallPageState createState() => _VideoCallPageState();
}

class _VideoCallPageState extends State<VideoCallPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // Set up platform-specific creation params
    late  PlatformWebViewControllerCreationParams params;
    params = const PlatformWebViewControllerCreationParams();
    if (WebViewPlatform.instance is AndroidWebViewPlatform) {
      // Use Android-specific params if desired (none needed here)
      params = AndroidWebViewControllerCreationParams.fromPlatformWebViewControllerCreationParams(params);
    }
    // Create controller and handle permission requests
    _controller = WebViewController.fromPlatformCreationParams(
      params,
      onPermissionRequest: (WebViewPermissionRequest request) {
        // Grant all requested permissions (e.g. camera, microphone)
        request.grant();
      },
    );
    _initController();
  }

  Future<void> _initController() async {
    // Enable unrestricted JS to allow getUserMedia
    await _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    // Disable user gesture requirement for media playback (optional)
    if (_controller.platform is AndroidWebViewController) {
      ( _controller.platform as AndroidWebViewController )
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // Finally, load the Daily.co meeting URL
    _controller.loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: _controller),
    );
  }
}

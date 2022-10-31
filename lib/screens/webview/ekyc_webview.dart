import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:nab_store/constants.dart';
import 'package:nab_store/responsive.dart';

class WebviewEKYC extends StatefulWidget {
  const WebviewEKYC({
    Key? key,
  }) : super(key: key);

  @override
  State<WebviewEKYC> createState() => _WebviewEKYCState();
}

class _WebviewEKYCState extends State<WebviewEKYC> {
  late InAppWebViewController _webViewController;
  // final Completer<WebViewController> _controller =
  //     Completer<WebViewController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // if (Platform.isAndroid) {
    //   WebView.platform = AndroidWebView();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Web View',
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[700]?.withOpacity(0.4),
      ),
      // body: SafeArea(
      //   child: WebView(
      //     // onWebViewCreated: (WebViewController webViewController) {
      //     //   _controller.complete(webViewController);
      //     // },
      //     // javascriptChannels: <JavascriptChannel>{
      //     //   _toasterJavascriptChannel(context),
      //     // },
      //     // gestureNavigationEnabled: true,
      //     // debuggingEnabled: true,
      //     // zoomEnabled: true,
      //     // allowsInlineMediaPlayback: true,
      //     initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
      //     //open webview with chrome browser
      //     userAgent:
      //         'Mozilla/5.0 (Linux; Android 4.1.1; Galaxy Nexus Build/JRO03C) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19',
      //     initialUrl: 'https://dev.acbs.tech/authenticate-portrait-guide',
      //     javascriptMode: JavascriptMode.unrestricted,
      //     gestureNavigationEnabled: true,
      //     //cach url when url chane
      //     navigationDelegate: (NavigationRequest request) {
      //       print(request.url);
      //       return NavigationDecision.navigate;
      //     },
      //   ),
      // ),
      body: InAppWebView(
          onLoadStart: (controller, resource) {
            print("NHAY VAO DAY");
            print("CONSOLE MESSAGE $resource");
            controller.getUrl().then((value) => print("IN CAI NAY: $value"));
            controller
                .getOriginalUrl()
                .then((value) => print("IN CAI NAY NUA: $value"));
          },
          // onConsoleMessage: (controller, resource) {
          //   print("NHAY VAO DAY");
          //   print("CONSOLE MESSAGE $resource");
          //   controller.getUrl().then((value) => print("IN CAI NAY: $value"));
          //   controller
          //       .getOriginalUrl()
          //       .then((value) => print("IN CAI NAY NUA: $value"));
          // },
          initialUrlRequest: URLRequest(
            url: Uri.parse("https://dev.acbs.tech/"),
          ),
          initialOptions: InAppWebViewGroupOptions(
            android: AndroidInAppWebViewOptions(
              useHybridComposition: true,
            ),
            ios: IOSInAppWebViewOptions(
              allowsInlineMediaPlayback: true,
            ),
            crossPlatform: InAppWebViewOptions(
              userAgent:
                  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36",
              useShouldOverrideUrlLoading: true,
              mediaPlaybackRequiresUserGesture: false,
            ),
          ),
          onWebViewCreated: (InAppWebViewController controller) {
            _webViewController = controller;
          },
          androidOnPermissionRequest: (InAppWebViewController controller,
              String origin, List<String> resources) async {
            return PermissionRequestResponse(
              resources: resources,
              action: PermissionRequestResponseAction.GRANT,
            );
          }),
    );
  }

  // JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
  //   return JavascriptChannel(
  //       name: 'Toaster',
  //       onMessageReceived: (JavascriptMessage message) {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text(message.message)),
  //         );
  //       });
  // }
}

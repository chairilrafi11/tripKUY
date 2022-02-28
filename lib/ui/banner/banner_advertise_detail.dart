// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:etekad/core/core.dart';
// import 'package:etekad/ui/component/component.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// import 'model/banner_advertise_model.dart';

// // ignore: must_be_immutable
// class BannerAdvertiseDetail extends StatelessWidget {

//   final String? title;
//   final BannerResponse? bannerAdvertiseResponse;

//   BannerAdvertiseDetail({Key? key, this.title, this.bannerAdvertiseResponse, this.webViewController}) : super(key: key);

//   InAppWebViewController? webViewController;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: EtekadPalette.white,
//       appBar: Component.appbarDefault(title: title ?? bannerAdvertiseResponse!.bannerName!),
//       body: bannerAdvertiseResponse!.linkUrl!.isNotEmpty
//         ? webView(context) 
//         : Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: pageView()
//         ),
//     );
//   }

//   Widget webView(context) {
//     return InAppWebView(
//       initialUrlRequest: URLRequest(url: Uri.parse(bannerAdvertiseResponse!.linkUrl!)),
//       initialOptions: InAppWebViewGroupOptions(
//         android: AndroidInAppWebViewOptions(
//         )
//       ),
//       onWebViewCreated: (InAppWebViewController controller) {
//         webViewController = controller;

//         controller.addJavaScriptHandler(handlerName: "flutterInAppWebViewPlatformReady", callback: (args) {
//           // Here you receive all the arguments from the JavaScript side 
//           // that is a List<dynamic>
//           CoreFunction.logPrint("args", args);
//           return args.reduce((curr, next) => curr + next);
//         });
//       },
//       onConsoleMessage: (InAppWebViewController controller, ConsoleMessage consoleMessage) {
//         CoreFunction.logPrint("console message: ", consoleMessage.message);
//         if(consoleMessage.message == "Success"){
//           Navigator.of(context).pop();
//         }
//       },
//     );
//   }

//   Widget pageView() {
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           InkWell(
//             onTap: () {
//               // AtozBottomSheet.previewImage(bannerAdvertiseResponse.imageUrl, "assets/icon/background_navigation_header.png", context);
//             },
//             child: CachedNetworkImage(
//               imageUrl: bannerAdvertiseResponse!.imageUrl!,
//               fit: BoxFit.cover,
//               width: SizeConfig.blockSizeHorizontal * 98,
//               placeholder: (context, url) => const CupertinoActivityIndicator(),
//               errorWidget: (context, url, error) => Image.asset(
//                 "assets/icon/background_navigation_header.png",
//                 fit: BoxFit.cover,
//                 width: 1000.0,
//               )
//             ),
//           ),
//           const Padding(padding: EdgeInsets.all(15)),
//           Text(
//             bannerAdvertiseResponse!.bannerName ?? "-",
//             textAlign: TextAlign.center,
//             style: const TextStyle(color: EtekadPalette.orange, fontSize: 18)
//           ),
//           Html(data: bannerAdvertiseResponse!.description ?? "-")
//         ],
//       )
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../component/component.dart';

class TermsConditionView extends StatelessWidget {

  const TermsConditionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Component.appBar('Syarat & Ketentuan'),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse("https://pintupay.id/help/persyaratan")),
      )
    );
  }
}

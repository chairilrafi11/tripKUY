import 'package:nav_router/nav_router.dart';
import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/util/size_config.dart';
import 'package:flutter/material.dart';

import '../../core/util/benpay_cupertino_dialog.dart';

class Component {

  static appBar(String title, {bool transparet = false}) => AppBar(
    backgroundColor: transparet ? Colors.transparent : PintuPayPalette.white,
    elevation: 0.0,
    title: Component.textBold(
      title, 
      fontSize: PintuPayConstant.fontSizeLargeExtra,
      colors: transparet ? PintuPayPalette.white : PintuPayPalette.darkBlue
    ),
    automaticallyImplyLeading: true,
    leading: InkWell(
      onTap: (){
        Navigator.of(navGK.currentContext!).pop();
      },
      child: const Icon(Icons.arrow_back, color: PintuPayPalette.darkBlue)
    )
  );

  static AppBar appBarLogo(){
    return AppBar(
      centerTitle: false,
      automaticallyImplyLeading: false,
      backgroundColor: PintuPayPalette.white,
      elevation: 0.0,
      title: Image.asset(
        "assets/icons/logo.png",
        width: SizeConfig.blockSizeHorizontal * 40,
      ),
    );
  }

  static appBarHeader(String title, {bool transparet = false}) => AppBar(
    backgroundColor: transparet ? Colors.transparent : PintuPayPalette.white,
    elevation: 0.0,
    title: Component.textBold(title, colors: PintuPayPalette.darkBlue),
    automaticallyImplyLeading: true,
  );

  static Text textBold(String content, {Color colors = Colors.black87,
    double fontSize = 15,
    int maxLines = 2,
    TextAlign textAlign = TextAlign.start}) {
    return Text(
      content,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: colors,
        fontFamily: PintuPayConstant.avenirRegular,
        fontSize: fontSize.toDouble(),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  static Text textDefault(
    String content,
    {Color colors = Colors.black54,
    double fontSize = 15,
    FontWeight fontWeight = FontWeight.normal,
    int maxLines = 2,
    TextAlign textAlign = TextAlign.start}) {
    return Text(
      content,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        fontWeight: fontWeight,
        color: colors,
        fontFamily: PintuPayConstant.avenirRegular,
        fontSize: fontSize.toDouble(),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  static InputDecoration inputDecoration(String label, {String? hintText, Widget? suffixIcon}) => InputDecoration(
    fillColor: PintuPayPalette.darkBlue,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: PintuPayPalette.darkBlue),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: PintuPayPalette.darkBlue),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: PintuPayPalette.darkBlue),
    ),
    counterText: "",
    hintText: hintText,
    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    labelText: label,
    labelStyle: const TextStyle(fontSize: PintuPayConstant.fontSizeMedium, color: PintuPayPalette.darkBlue),
    suffixIcon: suffixIcon,
    hintStyle: const TextStyle(fontSize: PintuPayConstant.fontSizeSmall, color: PintuPayPalette.darkBlue)
  );

  static decorationNoBorder(String hint) => InputDecoration(
    fillColor: PintuPayPalette.blueLight.withAlpha(50),
    filled: true,
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(10)
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(10)
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: PintuPayPalette.white),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: PintuPayPalette.white),
    ),
    counterText: "",
    hintText: hint,
    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
    // labelText: "Search",
    // suffixIcon: suffixIcon,
    hintStyle: const TextStyle(fontSize: 15.0, color: PintuPayPalette.blue1, fontWeight: FontWeight.w500)
  );

  static button({required String label, required VoidCallback? onPressed, Color color = PintuPayPalette.darkBlue}){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
      ),
      onPressed: onPressed,
      child: Container(
        width: SizeConfig.blockSizeHorizontal * 100,
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
        child: Text(
          label,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  static header() => Image.asset(
    "assets/images/header.png",
    fit: BoxFit.fill,
    height: SizeConfig.blockSizeVertical * 20,
    width: SizeConfig.blockSizeHorizontal * 100,
  );

  static Widget divider({int padding = 8}) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Divider(
        color: PintuPayPalette.grey,
        height: 1,
      ),
    );
  }

  static BoxDecoration backgroundPPOB()  {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          "assets/images/header.png",
        ),
        fit: BoxFit.cover,
      ),
    );
  }

  static Widget notice(String notice) {
    return Flexible(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.info, color: PintuPayPalette.darkBlue,),
          const SizedBox(width: 10,),
          Flexible(
            child: Component.textDefault(
              notice,
              fontSize: PintuPayConstant.fontSizeMedium,
              maxLines: 10
            ),
          )
        ],
      ),
    );
  }

  static Future<bool> showDialogWithRichText(RichText? text, {bool barrierDismissible = true}) async {
    bool isClosed = false;
    await showEtikadCupertionDialog(
      builder: (BuildContext buildContext) {
        return GestureDetector(
          onTap: () {
            Navigator.pop(buildContext);
          },
          child: BenpayCupertinoDialog(
            content: text,
          ),
        );
      },
      barrierDismissible: barrierDismissible,
    ).whenComplete(() {
      isClosed = true;
    });
    return isClosed;
  }

  static emptyRecent(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: textBold("Belum ada transaksi", textAlign: TextAlign.center)
    );
  }

}
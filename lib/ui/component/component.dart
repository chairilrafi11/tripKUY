import 'package:benpay/core/benpay_palette.dart';
import 'package:benpay/core/util/constant.dart';
import 'package:benpay/core/util/size_config.dart';
import 'package:flutter/material.dart';

class Component {

  static appBar(String title, {bool transparet = false}) => AppBar(
    backgroundColor: transparet ? Colors.transparent : BenpayPalette.white,
    elevation: 0.0,
    title: Component.textBold(
      title, 
      colors: transparet ? BenpayPalette.white : BenpayPalette.darkBlue
    ),
    automaticallyImplyLeading: true,
  );

  static appBarHeader(String title, {bool transparet = false}) => AppBar(
    backgroundColor: transparet ? Colors.transparent : BenpayPalette.white,
    elevation: 0.0,
    title: Component.textBold(title, colors: BenpayPalette.darkBlue),
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
        fontFamily: BenpayConstant.avenirRegular,
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
        fontFamily: BenpayConstant.avenirRegular,
        fontSize: fontSize.toDouble(),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  static InputDecoration inputDecoration(String label, {String? hintText, Widget? suffixIcon}) => InputDecoration(
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(10)
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: BenpayPalette.darkBlue),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: BenpayPalette.darkBlue),
    ),
    counterText: "",
    hintText: hintText,
    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    labelText: label,
    labelStyle: const TextStyle(fontSize: BenpayConstant.fontSizeMedium),
    suffixIcon: suffixIcon,
    hintStyle: const TextStyle(fontSize: BenpayConstant.fontSizeSmall)
  );

  static button({required String label, required VoidCallback? onPressed}){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: BenpayPalette.darkBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
      ),
      onPressed: onPressed,
      child: Container(
        width: SizeConfig.blockSizeHorizontal * 100,
        padding: const EdgeInsets.all(10.0),
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
        color: BenpayPalette.grey,
        height: 1,
      ),
    );
  }
}
import 'package:benpay/core/benpay_palette.dart';
import 'package:flutter/material.dart';

class Component {

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
        fontSize: fontSize.toDouble(),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  static AppBar appbarDefault({String title = "", List<Widget>? actions, double? fontSize}) {
    return AppBar(
      backgroundColor: BenpayPalette.darkBlue,
      automaticallyImplyLeading: true,
      centerTitle: true,
      elevation: 0.0,
      title: fontSize != null
          ? Text(
        title,
        style: TextStyle(fontSize: fontSize),
      )
          : Text(title),
      actions: actions,
    );
  }

  static InputDecoration inputDecoration(String label, {String? hintText, Widget? suffixIcon}) => InputDecoration(
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10)
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: BenpayPalette.green),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: BenpayPalette.red),
      ),
      counterText: "",
      hintText: hintText,
      contentPadding: const EdgeInsets.all(5),
      labelText: label,
      suffixIcon: suffixIcon,
      hintStyle: const TextStyle(fontSize: 15.0)
  );

  static InputDecoration inputDecorationDropdown(String label) => InputDecoration(
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10)
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: BenpayPalette.green),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: BenpayPalette.green),
      ),
      counterText: "",
      suffixIcon: const Icon(Icons.arrow_drop_down_outlined),
      contentPadding: const EdgeInsets.all(5),
      labelText: label,
      hintStyle: const TextStyle(fontSize: 16.0)
  );

}
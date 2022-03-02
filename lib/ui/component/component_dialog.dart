import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';

class ComponentDialog {
  
  final Animatable<double> _dialogScaleTween = Tween<double>(begin: 1.3, end: 1.0).chain(CurveTween(curve: Curves.linearToEaseOut));

  final Color _kModalBarrierColor = const CupertinoDynamicColor.withBrightness(
    color: Color(0x33000000),
    darkColor: Color(0x7A000000),
  );

  Future cupertinoDialog({required WidgetBuilder builder, RouteSettings? routeSettings}) async {
    return showGeneralDialog(
      context: navGK.currentContext!,
      barrierDismissible: true,
      barrierLabel: CupertinoLocalizations.of(navGK.currentContext!).modalBarrierDismissLabel,
      barrierColor: CupertinoDynamicColor.resolve(_kModalBarrierColor, navGK.currentContext!),
      // This transition duration was eyeballed comparing with iOS
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return builder(context);
      },
      transitionBuilder: _buildCupertinoDialogTransitions,
      useRootNavigator: true,
      routeSettings: routeSettings,
    );
  }

  Widget _buildCupertinoDialogTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    final CurvedAnimation fadeAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeInOut,
    );
    if (animation.status == AnimationStatus.reverse) {
      return FadeTransition(
        opacity: fadeAnimation,
        child: child,
      );
    }
    return FadeTransition(
      opacity: fadeAnimation,
      child: ScaleTransition(
        child: child,
        scale: animation.drive(_dialogScaleTween),
      ),
    );
  }



  static void dialogLoading() {
    showDialog(
      context: navGK.currentContext!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 10),
                // const JumpingDots(
                //   numberOfDots: 3,
                // ),
                const SizedBox(height: 10),
                Text(
                  "Mohon Tunggu",
                  style: TextStyle(
                    color: PintuPayPalette.green,
                    fontSize: SizeConfig.blockSizeHorizontal * 4),
                )
              ],
            )
          ),
        );
      },
    );
  }

}
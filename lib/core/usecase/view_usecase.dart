
import 'package:pintupay/core/util/util.dart';

enum Feature {pulsa, bpjs, telephone, pdam}

class ViewUsecase {

  static String iconFeature(Feature feature){
    switch (feature) {
      case Feature.pulsa:
        return "assets/icons/icmn_pulsa.png";
      case Feature.bpjs:
        return "assets/icons/icmn_bpjs.png";
      case Feature.telephone:
        return "assets/icons/icmn_telepon.png";
      case Feature.pdam:
        return "assets/icons/icmn_pdam.png";
      default:
        return "";
    }
  }

  static String nameFeature(Feature feature){
    switch (feature) {
      case Feature.pulsa:
        return "Pulsa";
      case Feature.bpjs:
        return "BPJS";
      case Feature.telephone:
        return "Telepon";
      case Feature.pdam:
        return "PDAM";
      default:
        return "";
    }
  }

  static String iconTransaction(String name){
    CoreFunction.logPrint("transaction name", name.toLowerCase());
    switch (name.toLowerCase()) {
      case "pulsa":
        return "assets/icons/icmn_pulsa.png";
      case "bpjs":
        return "assets/icons/icmn_bpjs.png";
      case "ppob telkom":
        return "assets/icons/icmn_telepon.png";
      case "pdam":
        return "assets/icons/icmn_pdam.png";
      default:
        return "";
    }
  }
}
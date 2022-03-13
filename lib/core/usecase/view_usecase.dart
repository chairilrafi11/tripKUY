
import 'package:pintupay/core/util/util.dart';

enum Feature {pulsa, bpjs, telephone, pdam, electric, phone, emoney, pgn}

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
      case Feature.electric:
        return "assets/icons/icmn_listrik.png";
      case Feature.phone:
        return "assets/icons/icmn_hppascabayar.png";
      case Feature.emoney:
        return "assets/icons/icmn_emoney.png";
      case Feature.pgn:
        return "assets/icons/icmn_pgn.png";
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
      case Feature.electric:
        return "Listrik";
      case Feature.phone:
        return "HP Pascabayar";  
      case Feature.emoney:
        return "Emoney";  
      case Feature.pgn:
        return "PGN";  
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
      case "ppob pln postpaid":
        return "assets/icons/icmn_listrik.png";
      case "cellular pasca bayar":
        return "assets/icons/icmn_hppascabayar.png";
      case "top up":
        return "assets/icons/icmn_hppascabayar.png";
      case "pgn":
        return "assets/icons/icmn_pgn.png";
      default:
        return "";
    }
  }
}
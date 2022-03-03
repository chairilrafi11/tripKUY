
enum Feature {pulsa, bpjs}

class ViewUsecase {

  static String iconFeature(Feature feature){
    // {"Bpjs",},
    // {"E-Money", "assets/icons/icmn_emoney.png"},
    // {"Hp Pascabayar", "assets/icons/icmn_hppascabayar.png"},
    // {"Listrik", "assets/icons/icmn_listrik.png"},
    // {"PDAM", "assets/icons/icmn_pdam.png"},
    // {"Pulsa",},
    // {"Telepon", "assets/icons/icmn_telepon.png"},
    // {"Paket \n Data", "assets/icons/icmn_tiket_kereta.png"}
    switch (feature) {
      case Feature.pulsa:
        return "assets/icons/icmn_pulsa.png";
      case Feature.bpjs:
        return "assets/icons/icmn_bpjs.png";
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
      default:
        return "";
    }
  }

}
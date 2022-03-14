class PintuPayEndpoint {
  static const String sample = "user";

  static const String banner = "v1/advertises";

  static const String checkPhoneRegist = "/v6/registration/agent/phones";

  static const String otpPhoneRegist = "/v6/registration/agent/otp";

  static const String area = "v2/areas";

  static const String formRegis = "v6/registration/agents";

  static const String verifPhone = "v6/registration/activations";

  static const String sessions = "v6/session/agents";

  static const String pulsaProduct = "v2/products";

  static const String pulsaProvider = "v2/products/provider_icon";

  static const String pulsaPayment = "v6/transactions";

  static const String transactionList = "v1/transactions";

  static const String profile = "v1/users/{auth_token}";

  static const String pascabayarProduct = "v2/ppob/cellulars/pasca_products";

  static const String phonePostpaidProvider =
      "v2/ppob/cellulars/pasca_products";

  static const String phonePostpaidInquiry = "v7/ppob/inquiry/cellulars";

  static const String phonePostpaidPayment = "v7/ppob/payment/cellulars";

  static const String emoneyProvider = "v2/emoney/provider_emoney";

  static const String emoneyProviderDetail = "v2/emoney/products";

  static const String emoneyPayment = "v7/transactions";

  static const String bpjsInuiqry = "v7/ppob/inquiry/bpjs";

  static const String bpjsPayment = "v7/ppob/payment/bpjs";

  static const String telephoneInquiry = "v7/ppob/inquiry/telkoms";

  static const String telephonePayment = "v7/ppob/payment/telkoms";

  static const String listrikToken = "v2/product_token";

  static const String listrikPrepaidInquiry = "v7/ppob/inquiry/pln_prepaids";

  static const String listrikPrepaidPayment = "v7/ppob/payment/plns";

  static const String listrikPostpaidInquiry = "v7/ppob/inquiry/plns";

  static const String listrikPostpaidPayment = "v7/ppob/payment/plns";

  static const String pdamProduct = "v1/pdam_products";

  static const String pdamInquiry = " v7/ppob/inquiry/pdams";

  static const String pdamPayment = "v7/ppob/payment/pdams";

  static const String bank = "v2/bank_accounts/get_bank";

  static const String topupRequest = "v6/topup/transactions";

  static const String topupConfirm = "v6/topup/confirms";

  static const String pgnInquiry = "v6/ppob/inquiry/pgns";

  static const String pgnPayment = "v6/ppob/payment/pgns";

  static const String menus = "v3/android_menus";

  static const String gameProvider = "v2/game/provider_games";

  static const String gameProduct = "v2/game/get_list_games";

  static const String getProfileUser = "v1/users/{auth_token}";

  static const String updateProfileUser = "v6/account/profile}";

  static const String setPin = "v6/account/pin";

  static const String checkPin = "v1/users/{user_id}/get_pin";

  static const String logout = "v2/sessions/{auth_token}";

  static const String changePassword = "v6/account/credential";

}

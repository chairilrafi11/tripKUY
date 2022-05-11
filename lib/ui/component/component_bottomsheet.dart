import 'package:pintupay/core/pintupay/pintupay_constant.dart';

class ComponentBottomsheet {

  static String errorTitle(ErrorPPOB errorPPOB){
    switch (errorPPOB) {
      case ErrorPPOB.payed:
        return "Belum ada Tagihan";
      case ErrorPPOB.unknow:
        return "No Pelanggan tidak di temukan";
      default:
        return "";
    }
  }
  
  static String errorDesc(ErrorPPOB errorPPOB){
    switch (errorPPOB) {
      case ErrorPPOB.payed:
        return "Yeayyy, belum ada tagihan nih saat ini. Yuk gunain saldo kamu untuk transaksi yang lain";
      case ErrorPPOB.unknow:
        return "Sepertinya nomor tujuan yang anda masukan salah, coba cek kembali";
      default:
        return "";
    }
  }
  
  static String errorImage(ErrorPPOB errorPPOB){
    switch (errorPPOB) {
      case ErrorPPOB.payed:
        return "assets/images/payed.png";
      case ErrorPPOB.unknow:
        return "assets/images/uknow_id.png";
      default:
        return "";
    }
  }

}
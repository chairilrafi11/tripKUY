
import 'package:pintupay/ui/banner/model/banner_advertise_model.dart';

class BannerProvider {
  int _dot = 0;
  int getDot() => _dot;

  void setDot(int index) => _dot = index;

  Future<List<BannerResponse>> fetchBanner(String type) async {
    // var dio = await DioService.checkConnection(isUseBearer: true, tryAgainMethod: fetchBanner,params: [type], baseUrl: BASE_URL.platform);
    // var client = DioClient(dio);
    // var banners = await client.banners(type);
    var banners = [
      BannerResponse(
        imageUrl: "assets/images/banner_0.png",
        bannerName: "Umrah bersama Pintupay",
        description: "In accordance to the Shariah (Law of Islam), for both pilgrimages, a Muslim must first assume Ihram, a state of purification achieved by completing cleansing rituals, wearing the prescribed attire, and abstaining from certain actions. This must be attained when reaching a Miqat, a principal boundary point in Mecca, like Dhu 'l-Hulaifah, Juhfah, Qarnu 'l-Manāzil, Yalamlam, Zāt-i-'Irq, Ibrahīm Mursīyah, or a place in Al-Hill. Different conditions exist for air travelers, who must observe Ihram once entering a specific perimeter in the city."
      ),
      BannerResponse(
        imageUrl: "assets/images/banner_1.png"
      ),
      // BannerResponse(
      //   imageUrl: "assets/images/banner_2.png"
      // ),
      // BannerResponse(
      //   imageUrl: "assets/images/banner_3.png"
      // ),
    ];
    return banners;
  }

}

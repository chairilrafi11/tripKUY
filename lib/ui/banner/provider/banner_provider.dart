
import 'package:benpay/ui/banner/model/banner_advertise_model.dart';

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
        imageUrl: "assets/images/banner_1.png"
      ),
      BannerResponse(
        imageUrl: "assets/images/banner_2.png"
      ),
      BannerResponse(
        imageUrl: "assets/images/banner_3.png"
      ),
    ];
    return banners;
  }

}

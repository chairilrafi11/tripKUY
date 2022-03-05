
import 'package:pintupay/core/network/network.dart';
import 'package:pintupay/ui/banner/model/banner_advertise_model.dart';

class BannerProvider {
  int _dot = 0;
  int getDot() => _dot;

  void setDot(int index) => _dot = index;

  Future<List<BannerResponse>> fetchBanner(String type) async {
    List<BannerResponse> list = [];
    var dio = await DioService.checkConnection(isUseBearer: true, tryAgainMethod: fetchBanner);
    var client = DioClient(dio);
    var banners = await client.banner();
    for (var i = 0; i < banners.data.length; i++) {
      list.add(BannerResponse.fromJson(banners.data[i]));
    }
    return list;
  }

}

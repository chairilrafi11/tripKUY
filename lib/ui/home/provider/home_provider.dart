import 'package:pintupay/core/network/network.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';
import 'package:pintupay/ui/home/model/menu_response.dart';

class HomeProvider {

  static Future<List<MenuResponse>> menus() async {
    List<MenuResponse> list = [];
    var dio = await DioService.checkConnection(tryAgainMethod: menus);
    DioClient dioClient = DioClient(dio);
    var menu = await dioClient.menus(authUsecase.userBox.authToken!);
    for (var i = 0; i < menu.data.length; i++) {
      list.add(MenuResponse.fromJson(menu.data[i]));
    }
    return list;
  }

  static Future<List<MenuResponse>> recommended() async {
    List<MenuResponse> list = [];
    var dio = await DioService.checkConnection(tryAgainMethod: menus);
    DioClient dioClient = DioClient(dio);
    var menu = await dioClient.recommended();
    for (var i = 0; i < menu.data.length; i++) {
      list.add(MenuResponse.fromJson(menu.data[i]));
    }
    return list;
  }
}
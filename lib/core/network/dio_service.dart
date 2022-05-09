import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/error/error.dart';
import 'package:pintupay/core/util/core_function.dart';
import 'package:pintupay/core/util/core_variable.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../ui/component/component_dialog.dart';
import 'model/core_model.dart';

enum BASE_URL { platform, product, province }

class DioService {
  static late Dio dio;

  static Future<Dio> checkConnection({
    bool showMessage = true,
    bool isLoading = false,
    bool isUseBearer = true,
    bool isBaseUrl = false,
    bool isGeocode = false,
    required dynamic tryAgainMethod,
    dynamic stopLoadingMethod,
    List<dynamic>? params,
  }) async {
    if (isLoading) {
      ComponentDialog.dialogLoading();
    }
    return await CoreFunction.checkConnectivity().then((internet) async {
      if (internet) {
        return await settingUpDio(
          isUseBearer: isUseBearer,
          showMessage: showMessage,
          isLoading: isLoading,
          isGeocode: isGeocode,
          params: params,
          tryAgainMethod: tryAgainMethod,
          stopLoadingMethod: stopLoadingMethod,
          isBaseUrl: isBaseUrl,
        ).catchError((e) {
          CoreFunction.logPrint('catchError error catched settingUpDio', e.toString());
        });
      } else {
        if (isLoading) {
          Navigator.pop(navGK.currentContext!);
        }
        CoreFunction.showToast("Tidak ada konksi internet");
        return Dio();
      }
    });
  }

  static Future<Dio> settingUpDio(
      {bool showMessage = true,
      bool isLoading = false,
      bool isUseBearer = false,
      bool isGeocode = false,
      bool isPage = false,
      bool isBaseUrl = false,
      dynamic tryAgainMethod,
      dynamic stopLoadingMethod,
      dynamic params}) async {
    dio = Dio(await baseOptions(isBaseUrl, isGeocode, isUseBearer));

    try {
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions? requestOptions, handler) async {
            CoreFunction.logPrint("============= onRequest =============", "");
            handler.next(requestOptions!);
          },
          onResponse: (Response? response, handler) async {
            if (isLoading) {
              Navigator.pop(navGK.currentContext!);
            }

            CoreFunction.logPrint("============= onResponse =============", "");
            CoreFunction.logPrint("Response", response!.toString());

            ResponseConverter responseConverter = ResponseConverter();
            responseConverter.createResponse(response.data['meta']);
            
            if (responseConverter.code! > 200 && responseConverter.code! < 600) {
              ErrorHandlingResponse(responseConverter: responseConverter, showMessage: showMessage, isPage: isPage).checkErrror();
            }

            handler.next(response);
          },
          onError: (DioError e, handler) async {
            CoreFunction.logPrint("============= onError =============", "");
            CoreFunction.logPrint("e.response?.statusCode", e.response?.statusCode);
            CoreFunction.logPrint("e.response?.statusMessage", e.response?.statusMessage);
            CoreFunction.logPrint("e.error", e.error);
            CoreFunction.logPrint("============= onError =============", "");

            if (isLoading) {
              Navigator.pop(navGK.currentContext!);
            }

            //? Stop Loading From Layout
            if (stopLoadingMethod != null) stopLoadingMethod();

            if (e.type == DioErrorType.connectTimeout || e.type == DioErrorType.receiveTimeout || e.type == DioErrorType.sendTimeout) {
              CoreFunction.showToast("Koneksi terlalu lambat");
            } else if (e.type == DioErrorType.other) {
              CoreFunction.showToast("Periksa kembali koneksi anda", backgroundColor: PintuPayPalette.red);
            } else if (e.type == DioErrorType.response) {
              CoreFunction.logPrint(" =========== response.statusCode ===========", e.response!.statusCode);
              
              ResponseConverter responseConverter = ResponseConverter();
              try {
                CoreModel data = CoreModel.fromJson(e.response!.data);
                responseConverter.createResponse(data.meta.toJson());
                responseConverter.code ??= e.response?.statusCode!;

                ErrorHandlingResponse(responseConverter: responseConverter, showMessage: showMessage, isPage: isPage).checkErrror();
              } catch (error) {

                responseConverter.code = e.response!.statusCode!;
                responseConverter.message = e.response!.statusMessage!;

                ErrorHandlingResponse(responseConverter: responseConverter, showMessage: showMessage, isPage: isPage).checkErrror();
              }
            }

            handler.next(e);
            throw e.error;
          },
        ),
      );
    } catch (e) {
      CoreFunction.logPrint('rethrowing error', e.toString());
      rethrow;
    }

    dio.interceptors.add(PrettyDioLogger(
      error: CoreVariable.debug,
      request: CoreVariable.debug,
      requestBody: CoreVariable.debug,
      requestHeader: CoreVariable.debug,
      responseBody: CoreVariable.debug,
      responseHeader: CoreVariable.debug,
      compact: CoreVariable.debug,
      maxWidth: 500
    ));
    
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      
  return client;
};

    return dio;
  }

  static Future<BaseOptions> baseOptions(bool isBaseUrl, bool isGeoCode, bool isBearier) async {
    return BaseOptions(
      baseUrl: baseURL(),
      connectTimeout: CoreVariable.timeRequestApi.inMilliseconds,
      receiveTimeout: CoreVariable.timeRequestApi.inMilliseconds,
      sendTimeout: CoreVariable.timeRequestApi.inMilliseconds,
      headers: isBearier
        ? {
            'Cache-Control': CoreVariable.cacheControl,
            'Content-Type': CoreVariable.contentType,
            'ClientKey': CoreVariable.clientKey,
            'User-Agent' : "Android"
            // 'Apps-Version': CoreFunction.version(),
            // 'Apps-Origin': CoreVariable.appsOrigin,
            // 'Authorization': 'Bearer ' + (authUsecase.token ?? "")
          }
        : {
            'Cache-Control': CoreVariable.cacheControl,
            'Content-Type': CoreVariable.contentType,
            'ClientKey': CoreVariable.clientKey,
            'User-Agent' : "Android"
            // 'Apps-Version': CoreFunction.version(),
            // 'Apps-Origin': CoreVariable.appsOrigin
          }
    );
  }

  static String baseURL() {
    if(CoreVariable.production){
      return CoreVariable.urlProduction;
    } else {
      return CoreVariable.urlStagging;
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:stock_market/data/utils/exports.dart';
import 'package:stock_market/domain/abstract/ticker.dart';
import 'package:stock_market/domain/entities/error.dart';
import 'package:stock_market/domain/entities/ticker.dart';
import 'package:stock_market/environment.dart';
import 'package:dio/dio.dart' as dio;

class TickerRepository implements BaseTickerRepository {
  @override
  Future<Either<Failure, TickerModel>> tickerRepo() async {
    String accessKey = FlavorConfig.instance!.values.accessKey;
    try {
      final response = await dio.Dio().get("http://api.marketstack.com/v1/tickers?access_key=$accessKey",
          options: dio.Options(sendTimeout: 2000, receiveTimeout: 2000));

      if (kDebugMode) {
        print(response.statusCode);
        print(response.data);
      }
      Map<String, dynamic> content = response.data;
      TickerModel data = TickerModel.fromJson(content);
      return Right(data);
    } catch (e) {
      if (e is dio.DioError) {
        if (e.type == dio.DioErrorType.connectTimeout) {
          return Left(
              Failure(message: "Connection timed out\nplease try again"));
        } else if (e.type == dio.DioErrorType.response) {
          Map<String, dynamic> errorContent = e.response!.data;
          ErrorModel error = ErrorModel.fromJson(errorContent);
          debugPrint(errorContent.toString());
          return Left(Failure(message: error.error!.message!));
        } else {
          return Left(Failure(message: e.message));
        }
      } else if (e is FormatException) {
        return Left(Failure(message: "Format Exception"));
      } else {
        return Left(Failure(message: e.toString()));
      }
    }
  }
}






import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:stock_market/data/utils/exports.dart';
import 'package:stock_market/domain/abstract/historical_data.dart';
import 'package:stock_market/domain/entities/error.dart';
import 'package:stock_market/domain/entities/historical_data.dart';
import 'package:stock_market/environment.dart';
import 'package:dio/dio.dart' as dio;

class HistoricalDataRepository implements BaseHistoricalDataRepository {
  @override
  Future<Either<Failure, HistoricalDataModel>> historicalData() async {
     String accessKey = FlavorConfig.instance!.values.accessKey;
     try {
      final response = await dio.Dio().get("",
          options: dio.Options(sendTimeout: 2000, receiveTimeout: 2000));

      if (kDebugMode) {
        print(response.statusCode);
        print(response.data);
      }
      Map<String, dynamic> content = response.data;
      HistoricalDataModel data = HistoricalDataModel.fromJson(content);
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
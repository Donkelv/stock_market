import 'package:dartz/dartz.dart';
import 'package:stock_market/data/utils/exports.dart';

import 'package:stock_market/domain/entities/historical_data.dart';

abstract class BaseHistoricalDataRepository {
  Future<Either<Failure, HistoricalDataModel>> historicalData(String symbol, String? dateFrom, String? dateTo);
}

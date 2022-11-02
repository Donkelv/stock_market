import 'package:dartz/dartz.dart';
import 'package:stock_market/domain/entities/failure.dart';
import 'package:stock_market/domain/entities/ticker.dart';

abstract class BaseTickerRepository {
  Future<Either<Failure, TickerModel>> tickerRepo();
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stock_market/data/utils/exports.dart';
import 'package:stock_market/domain/entities/historical_data.dart';
part 'historical_data.freezed.dart';

@freezed
class HistoricalDataState with _$HistoricalDataState {
  const factory HistoricalDataState.offline() = _HistoricalDataStateOffline;
  const factory HistoricalDataState.initial() = _HistoricalDataStateInitial;
  const factory HistoricalDataState.loading() = _HistoricalDataStateLoading;
  const factory HistoricalDataState.data({required HistoricalDataModel data}) = _HistoricalDataStateData;
  const factory HistoricalDataState.error({required Failure error}) = _HistoricalDataStateError;
}


import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:stock_market/domain/entities/ticker.dart';
part 'ticker.freezed.dart';



@freezed
class TickerState with _$TickerState {
  const factory TickerState.offline() = _TickerStateOffline;
  const factory TickerState.initial() = _TickerStateInitial;
  const factory TickerState.loading() = _TickerStateLoading;
  const factory TickerState.data({required List<Data> data}) =
      _TickerStateData;
  const factory TickerState.error({required String failure}) =
      _TickerStateError;
}

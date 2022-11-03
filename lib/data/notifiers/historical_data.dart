import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:stock_market/data/utils/exports.dart';
import 'package:stock_market/domain/abstract/historical_data.dart';
import 'package:stock_market/domain/freezed/historical_data.dart';



class HistoricalDataNotifier extends StateNotifier<HistoricalDataState> {
  HistoricalDataNotifier({
    required this.ref,
    required BaseHistoricalDataRepository baseHistoricalDataRepository,
  })  : _baseHistoricalDataRepository = baseHistoricalDataRepository,
        super(const HistoricalDataState.initial());

  final Ref ref;
  final BaseHistoricalDataRepository _baseHistoricalDataRepository;

  Future<void> historicalData() async {
    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
          state = const HistoricalDataState.initial();
     
      if (result == ConnectivityResult.none) {
        state = const HistoricalDataState.offline();
      } else {
        final response = await _baseHistoricalDataRepository.historicalData();
        response.fold(
            (l) => state = HistoricalDataState.error(error: l.message),
            (r) => HistoricalDataState.data(data: r.data!));
      }
        });
    
  }
}

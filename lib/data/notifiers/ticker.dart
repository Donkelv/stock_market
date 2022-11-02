import 'package:stock_market/data/notifiers/connectivity.dart';
import 'package:stock_market/data/utils/exports.dart';
import 'package:stock_market/domain/abstract/ticker.dart';
import 'package:stock_market/domain/freezed/ticker.dart';

class TickerNotifier extends StateNotifier<TickerState> {
  TickerNotifier({
    required this.ref,
    required BaseTickerRepository baseTickerRepository,
  })  : _baseTickerRepository = baseTickerRepository,
        super(const TickerState.initial());

  final Ref ref;
  final BaseTickerRepository _baseTickerRepository;

  Future<void> ticker() async {
    state = const TickerState.initial();
    ref.watch(connectivityStreamProvider.stream);
    if (ref.watch(connectivityProvider) == ConnectionState.none) {
      state = const TickerState.offline();
    } else {
      final response = await _baseTickerRepository.tickerRepo();
      response.fold((l) => state =  TickerState.error(failure: l.message), (r) => state = TickerState.data(data: r.data!));
    }
  }
}

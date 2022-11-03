import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stock_market/data/providers/ticker.dart';
import 'package:stock_market/data/utils/exports.dart';
import 'package:stock_market/domain/abstract/ticker.dart';
import 'package:stock_market/domain/entities/ticker.dart';
import 'package:stock_market/domain/freezed/ticker.dart';
import 'package:stock_market/presentation/utils/color_const.dart';

class TickerNotifier extends StateNotifier<TickerState> {
  TickerNotifier({
    required this.ref,
    required BaseTickerRepository baseTickerRepository,
  })  : _baseTickerRepository = baseTickerRepository,
        super(const TickerState.initial());

  final Ref ref;
  final BaseTickerRepository _baseTickerRepository;

  StreamSubscription<ConnectivityResult> ticker() {
    return Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      debugPrint(result.toString());
      state = const TickerState.initial();

      if (result == ConnectivityResult.none) {
        Fluttertoast.showToast(
            msg:
                "Device offline",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorConst().jetBlack,
            textColor: ColorConst().white,
            fontSize: 14.0.sp);
        state = const TickerState.offline();
      } else {
        final response = await _baseTickerRepository.tickerRepo();
        response.fold((l) => state = TickerState.error(failure: l.message),
            (r) {
          state = TickerState.data(data: r.data!);
          ref
              .watch(tickerChangeNotifierProvider.notifier)
              .getTickers(data: r.data!);
        });
      }
    });
  }
}

////Ticker local list
///
///

class TickerChangeNotifier extends ChangeNotifier {
  List<Data> localData = [];
  List<Data> filterData = [];

  ///[data]
  void getTickers({required List<Data> data}) {
    List<Data> local = [];
    //print(data);
    for (var i = 0; i < 10; i++) {
      local.add(data[i]);
      localData = local;
      notifyListeners();
    }

    //print(localData.length);
  }

  void filterTickers({required String characters}) {
    filterData = localData
        .where((element) =>
            element.name!.toLowerCase().contains(characters.toLowerCase()))
        .toList();
    notifyListeners();
  }
}

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:stock_market/data/utils/exports.dart';

final connectivityStreamProvider = StreamProvider((ref) {
  final subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) =>
          ref.read(connectivityProvider.notifier).state = result);
  ref.onDispose(() => subscription.cancel());
  return Connectivity().onConnectivityChanged;
});

final connectivityProvider = StateProvider<ConnectivityResult?>((_) => null);

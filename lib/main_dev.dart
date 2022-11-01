






import 'package:stock_market/app/navigator.dart';
import 'package:stock_market/data/utils/exports.dart';
import 'package:stock_market/environment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  FlavorConfig(flavor: Flavor.dev, values: FlavorValues(accessKey: ""));

  runApp(const NavigatorPath());
}

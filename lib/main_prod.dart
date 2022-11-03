import 'package:stock_market/app/app.dart';
import 'package:stock_market/data/utils/exports.dart';
import 'package:stock_market/environment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  FlavorConfig(
      flavor: Flavor.production,
      values: FlavorValues(accessKey: "844f4020dea5a0bfbf3cc2041d9d0d99"));

  runApp(const NavigatorPath());
}

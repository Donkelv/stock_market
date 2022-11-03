






import 'package:stock_market/app/app.dart';
import 'package:stock_market/data/utils/exports.dart';
import 'package:stock_market/environment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  FlavorConfig(flavor: Flavor.dev, values: FlavorValues(accessKey: "06eec0d8920598014b2b3322ce746800"));

  runApp(const NavigatorPath());
}

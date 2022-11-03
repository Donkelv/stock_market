



import 'package:stock_market/data/utils/exports.dart';
import 'package:stock_market/presentation/utils/color_const.dart';

class InitialWidget extends StatelessWidget {
  const InitialWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: CircularProgressIndicator(
          strokeWidth: 3.0,
          valueColor: AlwaysStoppedAnimation<Color>(ColorConst().gunMetalgray)),
    );
  }
}

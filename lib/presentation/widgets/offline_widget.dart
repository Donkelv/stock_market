import 'package:stock_market/data/utils/exports.dart';
import 'package:stock_market/presentation/utils/color_const.dart';

class OfflineWidget extends StatelessWidget {
  const OfflineWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Icon(
        Icons.signal_cellular_off_outlined,
        color: ColorConst().gunMetalgray,
        size: 100.0.sp,
      ),
    );
  }
}

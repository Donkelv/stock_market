



import 'package:stock_market/data/utils/exports.dart';
import 'package:stock_market/presentation/utils/color_const.dart';
import 'package:stock_market/presentation/utils/theme.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    Key? key,
    required this.error,
  }) : super(key: key);
  final String error;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.error_outline_rounded,
          color: ColorConst().gunMetalgray,
          size: 100.0.sp,
        ),
        SizedBox(
          height: 15.0.h,
        ),
        Text(
          error,
          textAlign: TextAlign.center,
          style: normalText().copyWith(color: ColorConst().gunMetalgray),
        ),
      ],
    );
  }
}

import 'package:stock_market/data/utils/exports.dart';
import 'package:stock_market/presentation/utils/color_const.dart';

import 'package:stock_market/presentation/widgets/ticker/ticker_details.dart';
import 'package:stock_market/presentation/widgets/ticker/ticker_header.dart';


class TickerDetailsPage extends StatelessWidget {
  const TickerDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        // For Android.
        // Use [light] for white status bar and [dark] for black status bar.
        statusBarIconBrightness: Brightness.dark,
        // For iOS.
        // Use [dark] for white status bar and [light] for black status bar.
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: ColorConst().jetBlack,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.0.h,
                ),
                const TickerHeader(),
                const TickerDetails()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
















import 'package:intl/intl.dart';
import 'package:stock_market/data/providers/historical_data.dart';
import 'package:stock_market/data/providers/ticker.dart';
import 'package:stock_market/data/utils/exports.dart';

import 'package:stock_market/domain/entities/ticker.dart';
import 'package:stock_market/presentation/pages/date_picker.dart';
import 'package:stock_market/presentation/pages/home_page.dart';
import 'package:stock_market/presentation/utils/color_const.dart';
import 'package:stock_market/presentation/utils/theme.dart';
import 'package:stock_market/presentation/widgets/ticker/ticker_details.dart';
import 'package:stock_market/presentation/widgets/ticker/ticker_header.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../widgets/custom_error_widget.dart';
import '../widgets/initial_widget.dart';
import '../widgets/loading_widget.dart';
import '../widgets/offline_widget.dart';


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
















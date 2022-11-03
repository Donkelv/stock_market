import 'package:stock_market/presentation/utils/color_const.dart';
import 'package:stock_market/presentation/utils/theme.dart';
import 'package:stock_market/presentation/widgets/home/custom_search_field.dart';
import '../../data/utils/exports.dart';
import '../widgets/home/stock_list.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final String date =
      "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10.0.h,
                ),
                Text(
                  'Stocks',
                  style: largeTextInter(),
                ),
                SizedBox(
                  height: 5.0.h,
                ),
                Text(
                  date,
                  style:
                      mediumTextInter().copyWith(color: ColorConst().mistyBlue),
                ),
                SizedBox(
                  height: 15.0.h,
                ),
                CustomSearchField(size: size),
                SizedBox(
                  height: 15.0.h,
                ),
                const StockList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}














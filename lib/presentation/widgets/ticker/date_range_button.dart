import 'package:stock_market/data/providers/historical_data.dart';
import 'package:stock_market/data/utils/exports.dart';
import 'package:stock_market/presentation/pages/date_picker.dart';
import 'package:stock_market/presentation/utils/color_const.dart';
import 'package:stock_market/presentation/utils/theme.dart';

class DateRangePicker extends ConsumerWidget {
  const DateRangePicker({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConst().gunMetalgray,
        borderRadius: BorderRadius.circular(5.0.w),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(5.0.w),
          onTap: () {
            debugPrint("pressed");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DatePickerRangeSelector()));
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                ref.watch(dateRangeProvider) ?? "Date range",
                style: smallText(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

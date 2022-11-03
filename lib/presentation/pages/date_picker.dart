import 'package:intl/intl.dart';
import 'package:stock_market/data/providers/ticker.dart';
import 'package:stock_market/data/utils/exports.dart';
import 'package:stock_market/presentation/utils/color_const.dart';
import 'package:stock_market/presentation/utils/theme.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../../data/providers/historical_data.dart';

class DatePickerRangeSelector extends ConsumerStatefulWidget {
  const DatePickerRangeSelector({Key? key}) : super(key: key);

  @override
  ConsumerState<DatePickerRangeSelector> createState() =>
      _DatePickerRangeSelectorState();
}

class _DatePickerRangeSelectorState
    extends ConsumerState<DatePickerRangeSelector> {
  String _selectedDate = '';
  String _startDate = '';
  String _endDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  void _onSubmit(Object? value) {
    debugPrint(_startDate);
    debugPrint(_endDate);
    ref.watch(historicalDataStateProvider.notifier).historicalData(
        symbol: ref.watch(selectedTickerProvider)!.symbol!,
        dateFrom: _startDate,
        dateTo: _endDate);
    Navigator.pop(context);
  }

  void _onCancel() {
    ref.watch(dateRangeProvider.notifier).state = null;
    Navigator.pop(context);
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    /// The argument value will return the changed date as [DateTime] when the
    /// widget [SfDateRangeSelectionMode] set as single.
    ///
    /// The argument value will return the changed dates as [List<DateTime>]
    /// when the widget [SfDateRangeSelectionMode] set as multiple.
    ///
    /// The argument value will return the changed range as [PickerDateRange]
    /// when the widget [SfDateRangeSelectionMode] set as range.
    ///
    /// The argument value will return the changed ranges as
    /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
    /// multi range.
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
        ref.watch(dateRangeProvider.notifier).state = _range;
        _startDate = DateFormat('yyyy-MM-dd').format(args.value.startDate);
        _endDate = DateFormat('yyyy-MM-dd')
            .format(args.value.endDate ?? args.value.startDate);
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

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
        body: SfDateRangePickerTheme(
          data: SfDateRangePickerThemeData(
            brightness: Brightness.dark,
            backgroundColor: ColorConst().jetBlack,
            viewHeaderTextStyle: normalText(),
            headerTextStyle: normalText(),
            trailingDatesTextStyle: normalText(),
            leadingCellTextStyle: normalText(),
            leadingDatesTextStyle: normalText(),
            activeDatesTextStyle: normalText(),
            cellTextStyle: normalText(),
            //rangeSelectionColor: Colors.green,
            rangeSelectionTextStyle: normalText(),
            todayCellTextStyle: normalText(),
            selectionColor: Colors.blue,
            weekNumberTextStyle: normalText(),
            specialDatesTextStyle: normalText(),
            weekendDatesTextStyle: normalText(),
            //todayTextStyle: normalText().copyWith(color: Colors.red),
            
            //endRangeSelectionColor: Colors.red
          ),
          child: SafeArea(
            top: true,
            child: SfDateRangePicker(
              selectionMode: DateRangePickerSelectionMode.range,
              //backgroundColor: ColorConst().white,
              //selectionTextStyle: normalText(),
              //rangeTextStyle: normalText(),
              
              //selectionColor: ColorConst().w,
              onSelectionChanged: _onSelectionChanged,
              onSubmit: _onSubmit,
              onCancel: _onCancel,
              initialSelectedRange: PickerDateRange(
                  DateTime.now().subtract(const Duration(days: 4)),
                  DateTime.now().add(const Duration(days: 3))),
              showActionButtons: true,
              //initialSelectedRange: PickerDateRange(DateTime.now().subtract(Duration(m)), endDate),
            ),
          ),
        ),
      ),
    );
  }
}

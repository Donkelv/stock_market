import 'package:intl/intl.dart';
import 'package:stock_market/data/providers/historical_data.dart';
import 'package:stock_market/data/providers/ticker.dart';
import 'package:stock_market/data/utils/exports.dart';
import 'package:stock_market/domain/entities/historical_data.dart'
    as historical;
import 'package:stock_market/domain/entities/ticker.dart';
import 'package:stock_market/presentation/pages/date_picker.dart';
import 'package:stock_market/presentation/pages/home_page.dart';
import 'package:stock_market/presentation/utils/color_const.dart';
import 'package:stock_market/presentation/utils/theme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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

class TickerDetails extends ConsumerWidget {
  const TickerDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historicalData = ref.watch(historicalDataStateProvider);
    Data? selectedTicker = ref.watch(selectedTickerProvider);
    return Expanded(
      child: historicalData.when(offline: () {
        return const OfflineWidget();
      }, initial: () {
        return const InitialWidget();
      }, loading: () {
        return const LoadingWidget();
      }, data: (data) {
        if (data.isEmpty) {
          return const CustomErrorWidget(error: "No Stock details available");
        } else {
          return TickerData(data: data, selectedTicker: selectedTicker);
        }
      }, error: (error) {
        return CustomErrorWidget(
          error: error,
        );
      }),
    );
  }
}

class TickerData extends StatelessWidget {
  TickerData({
    Key? key,
    required this.data,
    required this.selectedTicker,
  }) : super(key: key);
  final List<historical.Data>? data;
  final Data? selectedTicker;

  final f = NumberFormat("###,###.0#", "en_US");

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20.0.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              data!.first.close.toString(),
              style: semiLargeTextInter(),
            ),
            const DateRangePicker()
          ],
        ),
        SizedBox(
          height: 10.0.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              selectedTicker!.stockExchange!.acronym!,
              style: normalText().copyWith(
                color: ColorConst().gunMetalgray,
              ),
            ),
            SizedBox(
              width: 20.0.w,
            ),
            Text(
              selectedTicker!.stockExchange!.countryCode!,
              style: normalText().copyWith(
                color: ColorConst().gunMetalgray,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50.h,
        ),
        TickerChartWidget(data: data, selectedTicker: selectedTicker),
        SizedBox(
          height: 100.0.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            RichText(
              text: TextSpan(
                  text: "Volume: ",
                  style:
                      normalText().copyWith(color: ColorConst().gunMetalgray),
                  children: [
                    TextSpan(
                      text: f.format(data!.first.volume),
                      style:
                          mediumTextInter().copyWith(color: ColorConst().white),
                    )
                  ]),
            ),
            RichText(
              text: TextSpan(
                text: "Open: ",
                style: normalText().copyWith(color: ColorConst().gunMetalgray),
                children: [
                  TextSpan(
                    text: data!.first.open.toString(),
                    style:
                        mediumTextInter().copyWith(color: ColorConst().white),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.0.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            RichText(
              text: TextSpan(
                text: "High: ",
                style: normalText().copyWith(color: ColorConst().gunMetalgray),
                children: [
                  TextSpan(
                    text: data!.first.high.toString(),
                    style:
                        mediumTextInter().copyWith(color: ColorConst().white),
                  )
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: "Low: ",
                style: normalText().copyWith(color: ColorConst().gunMetalgray),
                children: [
                  TextSpan(
                    text: data!.first.low.toString(),
                    style:
                        mediumTextInter().copyWith(color: ColorConst().white),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

class TickerChartWidget extends StatelessWidget {
  const TickerChartWidget({
    Key? key,
    required this.data,
    required this.selectedTicker,
  }) : super(key: key);

  final List<historical.Data>? data;
  final Data? selectedTicker;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      backgroundColor: Colors.transparent,
      borderColor: Colors.transparent,
      //plotAreaBackgroundColor: Colors.red,
      plotAreaBorderColor: Colors.transparent,
      primaryXAxis: DateTimeAxis(
        //axisBorderType: AxisBorderType.withoutTopAndBottom,

        majorGridLines: const MajorGridLines(width: 0),
        //minorGridLines: MinorGridLines(width: 0),
        //axisLine: AxisLine(width: 0)
      ),
      primaryYAxis: NumericAxis(
        majorGridLines: const MajorGridLines(width: 0),
        //axisLine: AxisLine(width: 0)
      ),
      //legend: Legend(isVisible: true),
      // Enable tooltip
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <ChartSeries>[
        LineSeries<historical.Data, DateTime>(
          dataSource: data!,
          xValueMapper: (historical.Data data, _) => DateTime.parse(data.date!),
          yValueMapper: (historical.Data data, _) => data.close!.toInt(),
          name: selectedTicker!.symbol!,
          color: data!.first.close! > data!.first.open!
              ? Colors.green
              : data!.first.close! < data!.first.open!
                  ? Colors.red
                  : Colors.blue,
          emptyPointSettings: EmptyPointSettings(
              // Mode of empty point
              mode: EmptyPointMode.average),
          enableTooltip: true,
        )
      ],
    );
  }
}



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

class TickerHeader extends ConsumerWidget {
  const TickerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Data? selectedTicker = ref.watch(selectedTickerProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          selectedTicker!.symbol!,
          style: largeTextInter(),
        ),
        SizedBox(
          width: 10.0.w,
        ),
        Text(
          selectedTicker.name!,
          style: mediumTextInter().copyWith(color: ColorConst().gunMetalgray),
        ),
      ],
    );
  }
}

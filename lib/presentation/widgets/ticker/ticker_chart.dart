


import 'package:stock_market/domain/entities/historical_data.dart'
    as historical;
import 'package:stock_market/data/utils/exports.dart';
import 'package:stock_market/domain/entities/ticker.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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

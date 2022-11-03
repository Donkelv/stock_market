import 'package:intl/intl.dart';
import 'package:stock_market/data/utils/exports.dart';
import 'package:stock_market/domain/entities/ticker.dart';
import 'package:stock_market/presentation/utils/color_const.dart';
import 'package:stock_market/presentation/utils/theme.dart';
import 'package:stock_market/domain/entities/historical_data.dart'
    as historical;
import 'package:stock_market/presentation/widgets/ticker/date_range_button.dart';
import 'package:stock_market/presentation/widgets/ticker/ticker_chart.dart';

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

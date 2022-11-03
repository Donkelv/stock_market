import 'package:searchfield/searchfield.dart';
import 'package:stock_market/data/providers/historical_data.dart';
import 'package:stock_market/data/providers/ticker.dart';
import 'package:stock_market/data/utils/exports.dart';
import 'package:stock_market/presentation/pages/ticker_page.dart';
import 'package:stock_market/presentation/utils/color_const.dart';
import 'package:stock_market/presentation/utils/theme.dart';

import '../../../domain/entities/ticker.dart';

class CustomSearchField extends ConsumerStatefulWidget {
  const CustomSearchField({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  ConsumerState<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends ConsumerState<CustomSearchField> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      decoration: BoxDecoration(
        color: ColorConst().gunMetalgray,
        borderRadius: BorderRadius.circular(10.0.w),
      ),
      child: SearchField(
        controller: controller,
        suggestions: ref
            .watch(tickerChangeNotifierProvider.notifier)
            .localData
            .map((e) => SearchFieldListItem<Data>(
                  e.name!,
                  item: e,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                    child: Text(
                      e.name!,
                      style: normalText(),
                    ),
                  ),
                ))
            .toList(),
        suggestionState: Suggestion.expand,
        suggestionsDecoration: BoxDecoration(
          color: ColorConst().gunMetalgray,
        ),
        textInputAction: TextInputAction.next,
        hasOverlay: false,
        searchStyle: normalText(),
        searchInputDecoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search_rounded,
            color: ColorConst().mistyBlue,
          ),
          hintText: "Search",
          hintStyle: normalText().copyWith(color: ColorConst().mistyBlue),
          border: InputBorder.none,
        ),
        onSuggestionTap: (SearchFieldListItem data) {
          setState(() {
            ref
                .watch(historicalDataStateProvider.notifier)
                .historicalData(symbol: data.item!.symbol!);

            ref.watch(selectedTickerProvider.notifier).state = data.item!;

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TickerDetailsPage()));
          });
        },
      ),
    );
  }
}

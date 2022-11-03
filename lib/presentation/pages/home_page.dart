import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:stock_market/data/providers/ticker.dart';
import 'package:stock_market/domain/entities/ticker.dart';

import 'package:stock_market/presentation/utils/color_const.dart';
import 'package:stock_market/presentation/utils/theme.dart';

import '../../data/utils/exports.dart';

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
                  style: semiLargeTextInter(),
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

class StockList extends ConsumerStatefulWidget {
  const StockList({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<StockList> createState() => _StockListState();
}

class _StockListState extends ConsumerState<StockList> {
  StreamSubscription<ConnectivityResult>? subscription;
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      ref.watch(tickerStateProvider.notifier).ticker();
    });
    super.initState();
  }

  @override
  void dispose() {
    subscription!.cancel();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final ticker = ref.watch(tickerStateProvider);

    return Expanded(
      child: ticker.when(
        offline: () {
          return Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.signal_cellular_off_outlined,
              color: ColorConst().gunMetalgray,
              size: 100.0.sp,
            ),
          );
        },
        initial: () {
          return Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
                strokeWidth: 3.0,
                valueColor:
                    AlwaysStoppedAnimation<Color>(ColorConst().gunMetalgray)),
          );
        },
        loading: () {
          return Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
                strokeWidth: 3.0,
                valueColor:
                    AlwaysStoppedAnimation<Color>(ColorConst().gunMetalgray)),
          );
        },
        data: (data) {
          return const StockListWidget();
        },
        error: (error) {
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
        },
      ),
    );
  }
}

class StockListWidget extends ConsumerWidget {
  const StockListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    List<Data> localData = ref.watch(tickerChangeNotifierProvider).localData;
    return ListView.builder(
        shrinkWrap: true,
        itemCount: localData.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.transparent,
            width: size.width,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: (){
                  
                },
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: 10.0.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        localData[index].symbol!, style: largeTextInter(), ),
                      SizedBox(
                        height: 5.0.h,
                      ),
                      Text(
                        localData[index].name!,
                        style: normalText(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: ColorConst().gunMetalgray,
        borderRadius: BorderRadius.circular(10.0.w),
      ),
      child: TextFormField(
        keyboardType: TextInputType.name,

        //controller: controller,

        onChanged: (String value) {},
        style: normalText().copyWith(color: ColorConst().mistyBlue),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search_rounded,
            color: ColorConst().mistyBlue,
          ),
          // contentPadding: EdgeInsets.symmetric(
          //     vertical: 10.0.h, horizontal: 14.0.w),
          hintText: "Search",
          hintStyle: normalText().copyWith(color: ColorConst().mistyBlue),

          border: InputBorder.none,
        ),
      ),
    );
  }
}

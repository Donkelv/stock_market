import '../data/utils/exports.dart';

class NavigatorPath extends StatelessWidget {
  const NavigatorPath({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    );
    return ProviderScope(
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Stock Market',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const Home(),
            );
          },
        ),
    );
  }
}
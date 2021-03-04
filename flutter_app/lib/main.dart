import 'package:flutter/material.dart';
import 'demo/animation/animation_demo.dart';
import 'demo/basic_demo.dart';
import 'demo/bloc/bloc_demo.dart';
import 'demo/bottom_navigation_bar_demo.dart';
import 'demo/drawar_demo.dart';
import 'demo/form_demo.dart';
import 'demo/http/http_demo.dart';
import 'demo/i18n/i18n_demo.dart';
import 'demo/layout_demo.dart';
import 'demo/listview_demo.dart';
import 'demo/material_components.dart';
import 'demo/navigator_demo.dart';
import 'demo/rxdart/rxdart_demo.dart';
import 'demo/sliver_demo.dart';
import 'demo/state/state_management_demo.dart';
import 'demo/stream/stream_demo.dart';
import 'demo/view_demo.dart';
import 'demo/navigator_demo.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'demo/i18n/map/i18n_demo_localizations.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('zh', 'CN'),
      localizationsDelegates: [
        I18nDemoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        Locale('zh', 'CN'),
        Locale('en', 'US'),
      ],
      debugShowCheckedModeBanner: false,
//      home: NavigatorDemo(),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/about': (context) => Pages(title: 'about'),
        '/form': (context) => FormDemo(),
        '/mdc': (context) => MaterialConponents(),
        '/state_management': (context) => StateManagementDemo(),
        '/stream': (context) => StreamDemo(),
        '/rxdart': (context) => RxDartDemo(),
        '/bloc': (context) => BlocDemo(),
        '/http': (context) => HttpDemo(),
        '/animation': (context) => AnimationDemo(),
        '/i18n': (context) => I18nDemo(),
      },
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Colors.white70,
          accentColor: Color.fromRGBO(88, 90, 255, 0.5)),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
//              leading: IconButton(
//                  icon: Icon(Icons.menu),
//                  tooltip: 'Navagation',
//                  onPressed: () => debugPrint('Navagatin is press.')),
              title: Text('START'),
              actions: [
                IconButton(
                    icon: Icon(Icons.search),
                    tooltip: 'Search',
                    onPressed: () => debugPrint('Search is press.')),
                IconButton(
                    icon: Icon(Icons.more_horiz),
                    tooltip: 'more_horiz',
                    onPressed: () => debugPrint('More_Horize is press.'))
              ],
              elevation: 0.0,
              bottom: TabBar(
                unselectedLabelColor: Colors.black38,
                indicatorColor: Colors.black54,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 2.0,
                tabs: [
                  Tab(icon: Icon(Icons.local_florist)),
                  Tab(icon: Icon(Icons.history)),
                  Tab(icon: Icon(Icons.directions_bike)),
                  Tab(icon: Icon(Icons.list)),
                  Tab(icon: Icon(Icons.ac_unit_rounded)),
                ],
              )),
          body: TabBarView(children: [
            ListViewDemo(),
//            Icon(Icons.history, size: 128, color: Colors.black12),
            BasicDemo(),
//            Icon(Icons.directions_bike, size: 128, color: Colors.black12)
            LayoutDemo(),
            ViewDemo(),
            SliverDemo()
          ]),
          drawer: DrawerDemo(),
          bottomNavigationBar: BottomNavigationBarDemo(2),
        ));
  }
}

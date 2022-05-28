import 'package:flutter/material.dart';
import 'artist_page.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case HomePage.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return HomePage();
            });
          case AlbumPage.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return AlbumPage();
            });
          case TestListPage.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return TestListPage();
            });
          case ArtistDetailPage.routeName:
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(fullscreenDialog: true,
                    builder: (BuildContext context) {
                      return ArtistDetailPage(id: args['id']);
                  });
          default:
            return MaterialPageRoute(builder: (BuildContext context) {
              return HomePage();
            });
        }
      },
    );
  }
}

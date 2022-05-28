import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

int currentTabIndex = 0;
var currentPage;

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: DrawerList(),
      body: Center(
        child: Text('Home page'),
      ),
    );
  }
}

class DrawerList extends StatefulWidget {
  @override
  _DrawerListState createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  ScrollController controller = ScrollController(); //initialScrollOffset: 0);

  @override
  void initState() {
    super.initState();
    controller.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        controller: controller,
        children: listItemsString.map((item) {
          int tabIndex = listItemsString.indexOf(item);
          return ListTile(
            title: Text(item),
            textColor: currentTabIndex == tabIndex ? Colors.blue : Colors.black,
            onTap: () {
              setState(() {
                currentTabIndex = tabIndex;
              });
              if (tabIndex == 1) {
                // Navigator.of(context).pushNamed('/test');
                Navigator.of(context).pushNamed('/album');
              } else {
                Navigator.of(context).pushNamed('/');
              }
            },
          );
        }).toList(),
      ),
      // ),
    );
  }
}

class TestListPage extends StatefulWidget {
  static const routeName = '/test';

  @override
  _TestListPageState createState() => _TestListPageState();
}

class _TestListPageState extends State<TestListPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    currentTabIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Artists'),
        ),
        drawer:
          DrawerList(),
        body: Center(
          child: Text('Test page'),
        ),
    );
  }
}

List<String> listItemsString = [
  'Home',
  'Artists',
];


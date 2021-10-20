import 'package:flutter/material.dart';
import 'package:my_app/common/Http.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    var result = await Http().getArtistList();
    print(result);
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      // extendBody: true,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Text('1234'),
            ),
          )
        ],
      ),
    );
  }
}

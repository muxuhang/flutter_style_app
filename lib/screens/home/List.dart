import 'package:flutter/material.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class HomeList extends StatefulWidget {
  HomeList(
      {Key key,
      this.renderHeadContainer,
      this.spacing = 5,
      this.rowNums = 2,
      this.padding,
      this.list,
      this.renderItem})
      : super(key: key);
  final Widget renderHeadContainer;
  final double spacing;
  final int rowNums;
  final EdgeInsets padding;
  final List list;
  final Function renderItem;

  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  Widget build(BuildContext context) {
    // print('${widget.renderItem(widget.list[0])}');
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(top: 60),
              child: widget.renderHeadContainer,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              left: widget.spacing,
              right: widget.spacing,
            ),
            sliver: SliverWaterfallFlow(
              gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.rowNums,
                crossAxisSpacing: widget.spacing,
                mainAxisSpacing: widget.spacing,
                collectGarbage: (List<int> garbages) {
                  // print('collect garbage : $garbages');
                },
                viewportBuilder: (int firstIndex, int lastIndex) {
                  // print('viewport : [$firstIndex,$lastIndex]');
                },
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext c, int index) {
                  return widget.renderItem(widget.list[index], index);
                },
                childCount: widget.list.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

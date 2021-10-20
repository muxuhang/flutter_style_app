import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class ListBox extends StatefulWidget {
  ListBox({
    Key key,
    this.renderHeadContainer,
    this.renderFootContainer,
    this.spacing = 5,
    this.rowNums = 2,
    this.padding,
    this.list,
    this.renderItem,
    this.loadMore,
    this.refresh,
  }) : super(key: key);
  final Widget renderHeadContainer;
  final Widget renderFootContainer;
  final double spacing;
  final int rowNums;
  final EdgeInsets padding;
  final List list;
  final Function renderItem;
  final Function loadMore;
  final Function refresh;
  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<ListBox> {
  @override
  Widget build(BuildContext context) {
    var isLodingMore = true;
    ScrollController _controller;
    _controller = ScrollController();
    _controller.addListener(() {
      // int offset = _controller.position.pixels.toInt();
      // 如果滑动到底部
      if (_controller.position.maxScrollExtent == _controller.position.pixels) {
        if (isLodingMore) {
          this.setState(() {
            isLodingMore = false;
          });
          widget.loadMore();
          this.setState(() {
            isLodingMore = true;
          });
        }
      }
    });
    // print('${widget.re                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              nderItem(widget.list[0])}');
    return Scaffold(
      body: widget.list != null
          ? CustomScrollView(
              controller: _controller,
              slivers: <Widget>[
                CupertinoSliverRefreshControl(
                  onRefresh: () async {
                    return Future.delayed(Duration(seconds: 1), () {
                      widget.refresh();
                    });
                  },
                ),
                SliverToBoxAdapter(
                  child: Container(
                    // padding: EdgeInsets.only(top: 60),
                    child: widget.renderHeadContainer,
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(
                    left: widget.spacing,
                    right: widget.spacing,
                    top: widget.spacing,
                  ),
                  sliver: SliverWaterfallFlow(
                    gridDelegate:
                        SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
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
                        return Container(
                          child: widget.renderItem != null
                              ? widget.renderItem(widget.list[index], index)
                              : Container(),
                        );
                      },
                      childCount: widget.list.length,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    child: widget.renderFootContainer,
                  ),
                ),
              ],
            )
          : Container(),
    );
  }
}

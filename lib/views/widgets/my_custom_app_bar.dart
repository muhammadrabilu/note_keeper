import 'package:flutter/cupertino.dart';

class MyCustomAppBar extends SliverPersistentHeaderDelegate {
  MyCustomAppBar({required this.appBar});

  final Widget appBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // Your custom app bar widget goes here
    return appBar;
  }

  @override
  double get maxExtent => 100.0; // Adjust the maximum height of your app bar

  @override
  double get minExtent => 60.0; // Adjust the minimum height of your app bar

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

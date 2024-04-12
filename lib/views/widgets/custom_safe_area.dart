import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomSafeArea extends StatefulWidget {
  const CustomSafeArea(
      {Key? key,
      this.pageTitle,
      required this.body,
      this.backgroundColor,
      this.showAppBar = false,
      this.showFloatingActionButton = false,
      this.floatingActionButton})
      : super(key: key);
  final String? pageTitle;
  final Widget body;
  final Color? backgroundColor;
  final bool? showAppBar;
  final bool? showFloatingActionButton;
  final FloatingActionButton? floatingActionButton;

  @override
  State<CustomSafeArea> createState() => _CustomSafeAreaState();
}

class _CustomSafeAreaState extends State<CustomSafeArea> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.showAppBar!
            ? AppBar(
                title: Text(widget.pageTitle!),
                backgroundColor: widget.backgroundColor,
                elevation: 0,
              )
            : null,
        body: widget.body,
        floatingActionButton: widget
            .floatingActionButton // This trailing comma makes auto-formatting nicer for build methods
        );
  }
}

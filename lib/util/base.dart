import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// This routine is invoked when the window metrics have changed. Useful for our case
  @override
  void didChangeMetrics() {
    if (MediaQuery.of(context).viewInsets.bottom > 0) {
      SystemChrome.restoreSystemUIOverlays();
    }
  }
}

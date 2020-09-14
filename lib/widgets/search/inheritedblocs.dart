import 'package:flutter/cupertino.dart';

import 'searchbloc.dart';

class InheritedBlocs extends InheritedWidget {
  InheritedBlocs({Key key, this.searchBloc, this.child})
      : super(key: key, child: child);

  final Widget child;
  final SearchBloc searchBloc;

  static InheritedBlocs of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<InheritedBlocs>());
  }

  @override
  bool updateShouldNotify(InheritedBlocs oldWidget) {
    return true;
  }
}

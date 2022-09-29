import 'package:flutter/material.dart';

extension WidgetSliverBoxAdapter on Widget {
  Widget get sliverBox => SliverToBoxAdapter(child: this);
}

import 'package:flutter/material.dart';
import 'package:tokenzyme_mobile/extensions/widget.dart';

class SmallCircularProgressIndicator extends StatelessWidget {
  const SmallCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(strokeWidth: 2).sizedBox(width: 18, height: 18);
  }
}

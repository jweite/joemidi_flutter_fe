import 'package:flutter/material.dart';

class TabBodyShow extends StatelessWidget {
  const TabBodyShow({
    super.key,
  });

  static const tabTitle = "Show";

  @override
    Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= constraints.maxHeight) {
          return buildLandscape(context);
        }
        else {
          return buildPortrait(context);
        }
      }
    );
  }

  Widget buildLandscape(BuildContext context) {
    return Row(children: [
      Expanded(
        flex: 1,
        child: Column(children: [
          Expanded(child:
            Placeholder()
          ),
          Expanded(child:
            Placeholder()
          )
        ],)
      ),
      Expanded(
        flex: 3,
        child: Placeholder()
      )
    ]);
  }

  Widget buildPortrait(BuildContext context) {
    return Column(children: [
      Expanded(
        flex: 3,
        child: Placeholder()
      ),
      Expanded(
        flex: 1,
        child: Row(children: [
          Expanded(child:
            Placeholder()
          ),
          Expanded(child:
            Placeholder()
          )
        ],)
      ),
    ]);
  }

}
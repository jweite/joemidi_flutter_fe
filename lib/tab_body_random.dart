import 'package:flutter/material.dart';

class TabBodyRandom extends StatelessWidget {
  const TabBodyRandom({
    super.key,
  });

  static const tabTitle = "Random";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(8, (rowIndex) {
        return Expanded(
          child: Column(
            children: List.generate(8, (columnIndex) {
              return Expanded(
                child: Container(
                  margin: EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: null,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(1000),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text("$rowIndex:$columnIndex")
                  )
                )
              );
            })
          )
        );
      })
    );
  }
}

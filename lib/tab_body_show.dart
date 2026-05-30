import 'package:flutter/material.dart';
import 'package:pdfrx/pdfrx.dart';

class TabBodyShow extends StatefulWidget {
  const TabBodyShow({
    super.key,
  });

  static const tabTitle = "Show";

  @override
  State<TabBodyShow> createState() => _TabBodyShowState();

}

class _TabBodyShowState extends State<TabBodyShow>{
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
          showSetlistWidget(),
          showSongPatchSelectWidget(),
        ],)
      ),
      Expanded(   // Chart
        flex: 3,
        child: PdfViewer.asset('assets/Fountain of Salamacis.pdf'),
      )
    ]);
  }

  Widget buildPortrait(BuildContext context) {
    return Column(children: [
      Expanded(
        flex: 3,
        child: PdfViewer.asset('assets/Fountain of Salamacis.pdf'),

      ),
      Expanded(
        flex: 1,
        child: Row(children: [
          showSetlistWidget(),
          showSongPatchSelectWidget(),
        ],)
      ),
    ]);
  }

  List<Widget> setlistSongButtons = [
    for (var i = 0; i < 10; ++i) Container(margin: EdgeInsets.all(2), child: ElevatedButton(onPressed: () {}, child: Text("Song $i"))),
  ];

  Widget showSetlistWidget() {
    return Expanded(
      child: Column(
              children: [
                showSetlistManagementButtons(),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(2.0),
                    margin: const EdgeInsets.only(left: 2, top: 0, right: 2, bottom: 2),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blueGrey,
                        width: 2.0,
                      ),
                    ),
                    child: ListView(
                      padding: const EdgeInsets.only(left: 8, top: 0, right: 8, bottom: 8),
                      children: setlistSongButtons
                    ),
                  )
                )
              ],
            ),
    );
  }

  Widget showSetlistManagementButtons() {
    return Container(
      padding: const EdgeInsets.all(2.0),
      margin: const EdgeInsets.only(left: 2, top: 2, right: 2, bottom: 1),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blueGrey,
          width: 2.0,
        ),
      ),
      child: Row(
        children: [
          Expanded(child: ElevatedButton(onPressed: () {}, child: Icon(Icons.arrow_upward))),
          Expanded(child: ElevatedButton(onPressed: () {}, child: Icon(Icons.file_open))),
          Expanded(child: ElevatedButton(onPressed: () {}, child: Icon(Icons.sort))),
          Expanded(child: ElevatedButton(onPressed: () {}, child: Text("^"))),
          Expanded(child: ElevatedButton(onPressed: () {}, child: Icon(Icons.arrow_downward))),
        ]
      ),
    );
  }

  List<Widget> showSongPatchSelectButtons = [
    for (var i = 0; i < 3; ++i) Container(margin: EdgeInsets.all(2), child: ElevatedButton(onPressed: () {}, child: Text("Patch $i"))),
  ];

  Widget showSongPatchSelectWidget() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(2.0),
        margin: const EdgeInsets.only(left: 2, top: 0, right: 2, bottom: 2),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blueGrey,
            width: 2.0,
          ),
        ),
        child: Column(
                children: [
                  Row(children: [Expanded(child: Container(margin: EdgeInsets.all(2), child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey, // Overrides the theme color
                      foregroundColor: Colors.white, // Overrides the text/icon color
                    ),
                    onPressed: () {}, 
                    child: Text("Prev"))))
                  ]),
                  Expanded(
                    child: ListView(
                      children: [
                        ...showSongPatchSelectButtons,
                      ]
                    ),
                  ),
                  Row(children: [Expanded(child: Container(margin: EdgeInsets.all(2), child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey, // Overrides the theme color
                      foregroundColor: Colors.white, // Overrides the text/icon color
                    ),
                    onPressed: () {}, 
                    child: Text("Next"))))
                  ]),
                ],
              ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

final List<String> _tagsList = <String>[
  "Business & Work", // 15
  "Personal", // 8
  "Transactions & OTP", // 18
  "Family", // 6
  "Friends", // 7
  "Add new+",
];

final List<String> _serviceList = <String>[
  "Call recording",
  "Incoming Call",
  "OutGoing Call"
];

class PhoneNumberConfigureScreen extends StatefulWidget {
  final String phoneNumber;
  final bool isDefaultCallerId;
  final Map<String, Color> tags;
  final List<Color> colors;

  const PhoneNumberConfigureScreen({
    required this.phoneNumber,
    required this.isDefaultCallerId,
    required this.tags,
    required this.colors,
    super.key,
  });

  @override
  State<PhoneNumberConfigureScreen> createState() =>
      _PhoneNumberConfigureScreenState();
}

class _PhoneNumberConfigureScreenState
    extends State<PhoneNumberConfigureScreen> {
  bool? isStillDefault;
  String isTag = "..";
  Color? isColor;

  final itemFontSize = 16.0;
  final itemSizeWeight = 2;

  Widget cservice(int index, List<String> _tags) {
    return Container(
        margin: EdgeInsets.only(top: 6, left: 4, right: 4),
        padding: const EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 246, 245, 246),
        ),
        child: Wrap(children: [
          _tags[index] == "Call recording"
              ? Icon(Icons.fiber_manual_record)
              : _tags[index] == "Incoming Call"
                  ? Icon(Icons.phone_callback)
                  : Icon(Icons.call_made),
          Text(
            _tags[index],
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ]));
  }

  // Widget getcardservices(BuildContext context) {
  //   return ResponsiveGridList(
  //     horizontalGridSpacing: 16, // Horizontal space between grid items
  //     verticalGridSpacing: 8, // Vertical space between grid items
  //     horizontalGridMargin: 20, // Horizontal space around the grid
  //     verticalGridMargin: 0, // Vertical space around the grid
  //     minItemWidth:
  //         140, // The minimum item width (can be smaller, if the layout constraints are smaller)
  //     minItemsPerRow: 1,
  //     // The minimum items to show in a single row. Takes precedence over minItemWidth
  //     maxItemsPerRow:
  //         5, // The maximum items to show in a single row. Can be useful on large screens
  //     listViewBuilderOptions: ListViewBuilderOptions(
  //       shrinkWrap: true,
  //       padding: EdgeInsets.zero,
  //     ), // Options that are getting passed to the ListView.builder() function
  //     children: [
  //       //tags.map((t) => tag(t)).toList(),
  //       cservice("Call recording", Icon(Icons.fiber_manual_record)),
  //       cservice(
  //           "Incoming Call",
  //           Icon(
  //             Icons.phone_callback,
  //           )),
  //       cservice(
  //           "Outgoing call",
  //           Icon(
  //             Icons.call_made,
  //           )),
  //     ], // The list of widgets in the list
  //   );
  // }

  Widget _getCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15.0),
      margin: EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ListTile(
            // leading: FlutterLogo(),
            leading: (CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://img.freepik.com/premium-photo/india-flag-background-design-independence-day-other-celebration_46250-2225.jpg?w=2000"),
            )),
            title: Container(
                margin: EdgeInsets.only(left: 5),
                child: Text(
                  "+1 111 111 1111",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )),
            subtitle: Container(
                margin: EdgeInsets.only(left: 5), child: Text("India")),
          ),
          Container(
            color: Color.fromARGB(255, 246, 245, 246),
            child: ListTile(
              title: Text(
                isTag,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              // subtitle: Text("Renewable on " + "ndf"),
              subtitle: Container(
                  margin: EdgeInsets.only(
                    top: 5,
                  ),
                  child: RichText(
                    text: TextSpan(
                        text: "Renewable on",
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: " 22 Aug, 2022",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ))
                        ]),
                  )),
              trailing: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: isTag == ".."
                      ? Text("")
                      : Text(
                          isTag[0],
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: isColor),
                        )),
            ),
          ),
          ListTile(
            title: Container(
                margin: EdgeInsets.only(top: 10),
                child: const Text(
                  "Services",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )),
            subtitle: Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: gridtags(context, _serviceList),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget _nthChild(int index, List<String> _tags) {
    return Container(
      margin: EdgeInsets.only(right: 9, top: 8),
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 2,
      ),
      child: TextButton(
          onPressed: () {
            setState(() {
              isTag = _tags[index];
              isColor = widget.tags[_tags[index]];
            });
          },
          child: FittedBox(
              fit: BoxFit.cover,
              child: Text(
                _tags[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isTag == _tags[index] ? Colors.black : Colors.white,
                ),
              ))),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.grey, width: 1),
        color: isTag == _tags[index] ? Colors.white : Colors.grey[850],
      ),
    );
  }

  List<Widget> _children(int startIndex, int numItems, List<String> _tags) {
    return List.generate(numItems, (nth) {
      final index = startIndex + nth;
      return _tags[0] == "Business & Work"
          ? _nthChild(index, _tags)
          : cservice(index, _tags);
    });
  }

  List<Widget> _rows(int maxCharacterAtCurrentWidth, List<String> _tags) {
    List<Widget> children = [];
    List<int> numItemsThatCanFitPerRow = [];

    int numItemsThatCanfit = 0;
    int numCharactersConsumed = 0;
    int startIndex = 0;
    for (int i = 0; i < _tags.length; i++) {
      if (numCharactersConsumed + _tags[i].length + 9 >=
          maxCharacterAtCurrentWidth) {
        children.add(
            Row(children: _children(startIndex, numItemsThatCanfit, _tags)));
        // print(maxCharacterAtCurrentWidth);
        // print(numItemsThatCanfit);
        // print(numCharactersConsumed);
        // print(_tags[i].length);
        numCharactersConsumed = _tags[i].length;
        numItemsThatCanfit = 1;
        startIndex = i;
      } else {
        numCharactersConsumed += (_tags[i].length + 9);
        numItemsThatCanfit += 1;
      }
    }
    children
        .add(Row(children: _children(startIndex, numItemsThatCanfit, _tags)));
    return children;
  }

  Widget gridtags(BuildContext context, List<String> _tags) {
    return LayoutBuilder(
      builder: (context, dimens) {
        //print(dimens.maxWidth);
        final maxCharacterAtCurrentWidth =
            (2 * (dimens.maxWidth / itemFontSize)).toInt();
        //print(maxCharacterAtCurrentWidth);

        return Column(
          children: _rows(maxCharacterAtCurrentWidth, _tags),
        );
      },
    );
  }

  // Widget tag(String text) {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(
  //       horizontal: 0,
  //       vertical: 0,
  //     ),
  //     child: TextButton(
  //         onPressed: () {
  //           setState(() {
  //             isTag = text;
  //             isColor = widget.tags[text];
  //           });
  //         },
  //         child: FittedBox(
  //             fit: BoxFit.cover,
  //             child: Text(
  //               text,
  //               textAlign: TextAlign.center,
  //               style: TextStyle(
  //                 color: isTag == text ? Colors.black : Colors.white,
  //               ),
  //             ))),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(100),
  //       border: Border.all(color: Colors.grey, width: 1),
  //       color: isTag == text ? Colors.white : Colors.grey[850],
  //     ),
  //   );
  // }

  Widget col(Color clr) {
    return Container(
        padding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
        //margin: EdgeInsets.only(top: 10, left: 0, right: 0, bottom: 0),
        child: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 0,
              ),
            ),
            onPressed: () {
              setState(() {
                isColor = clr;
              });
            },
            child: CircleAvatar(
              child: isColor == clr ? Icon(Icons.check_outlined) : null,
              backgroundColor: clr,
            )));
  }

  // Widget getTags(BuildContext context) {
  //   return ResponsiveGridList(
  //     horizontalGridSpacing: 8, // Horizontal space between grid items
  //     verticalGridSpacing: 16, // Vertical space between grid items
  //     horizontalGridMargin: 5, // Horizontal space around the grid
  //     verticalGridMargin: 10, // Vertical space around the grid
  //     minItemWidth:
  //         100, // The minimum item width (can be smaller, if the layout constraints are smaller)
  //     minItemsPerRow: 1,
  //     // The minimum items to show in a single row. Takes precedence over minItemWidth
  //     maxItemsPerRow:
  //         5, // The maximum items to show in a single row. Can be useful on large screens
  //     listViewBuilderOptions: ListViewBuilderOptions(
  //       shrinkWrap: true,
  //       padding: EdgeInsets.zero,
  //     ), // Options that are getting passed to the ListView.builder() function
  //     children: [
  //       //tags.map((t) => tag(t)).toList(),
  //       tag("Bussiness & work"),
  //       tag("Personal"),
  //       tag("Family"),
  //       tag("Stranger"),
  //       tag("Transaction and otp"),
  //       tag("Add new+")
  //     ], // The list of widgets in the list
  //   );
  //   // return Container(
  //   //   child: ListTile(
  //   //       title: Padding(
  //   //           padding: const EdgeInsets.only(bottom: 15.0),
  //   //           child: Text(
  //   //             "Tag",
  //   //             style: TextStyle(
  //   //               fontWeight: FontWeight.bold,
  //   //               color: Colors.white,
  //   //             ),
  //   //           )),
  //   //       subtitle: Flexible(
  //   //         child: Row(children: [
  //   //           Flexible(
  //   //               flex: 24,
  //   //               child: Container(
  //   //                 padding: const EdgeInsets.symmetric(
  //   //                   horizontal: 10,
  //   //                   vertical: 5,
  //   //                 ),
  //   //                 decoration: BoxDecoration(
  //   //                   borderRadius: BorderRadius.circular(10),
  //   //                   color: Colors.red,
  //   //                 ),
  //   //                 child: Text("Bussiness & work"),
  //   //               )),
  //   //           SizedBox(width: 5),
  //   //           Flexible(
  //   //               flex: 12,
  //   //               child: Container(
  //   //                 padding: const EdgeInsets.symmetric(
  //   //                   horizontal: 10,
  //   //                   vertical: 5,
  //   //                 ),
  //   //                 decoration: BoxDecoration(
  //   //                     borderRadius: BorderRadius.circular(10),
  //   //                     color: Colors.red),
  //   //                 child: Text("Personal"),
  //   //               )),
  //   //           SizedBox(width: 5),
  //   //           Flexible(
  //   //               flex: 12,
  //   //               child: Container(
  //   //                 padding: const EdgeInsets.symmetric(
  //   //                   horizontal: 10,
  //   //                   vertical: 5,
  //   //                 ),
  //   //                 decoration: BoxDecoration(
  //   //                     borderRadius: BorderRadius.circular(10),
  //   //                     color: Colors.red),
  //   //                 child: Text("family"),
  //   //               )),
  //   //           SizedBox(width: 5),
  //   //           Flexible(
  //   //               flex: 12,
  //   //               child: Container(
  //   //                 padding: const EdgeInsets.symmetric(
  //   //                   horizontal: 10,
  //   //                   vertical: 5,
  //   //                 ),
  //   //                 decoration: BoxDecoration(
  //   //                     borderRadius: BorderRadius.circular(10),
  //   //                     color: Colors.red),
  //   //                 child: Text("Stranger"),
  //   //               )),
  //   //           SizedBox(width: 5),
  //   //           Flexible(
  //   //               flex: 12,
  //   //               child: Container(
  //   //                 padding: const EdgeInsets.symmetric(
  //   //                   horizontal: 10,
  //   //                   vertical: 5,
  //   //                 ),
  //   //                 decoration: BoxDecoration(
  //   //                     borderRadius: BorderRadius.circular(10),
  //   //                     color: Colors.red),
  //   //                 child: Text("Transaction and otp"),
  //   //               )),
  //   //           SizedBox(width: 5),
  //   //           Flexible(
  //   //               flex: 12,
  //   //               child: Container(
  //   //                 padding: const EdgeInsets.symmetric(
  //   //                   horizontal: 10,
  //   //                   vertical: 5,
  //   //                 ),
  //   //                 decoration: BoxDecoration(
  //   //                     borderRadius: BorderRadius.circular(10),
  //   //                     color: Colors.red),
  //   //                 child: Text("+Add New"),
  //   //               ))
  //   //         ]),
  //   //       )),
  //   // );
  // }

  Widget gt(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, right: 10, bottom: 0, left: 10),
      child: ListTile(
          title: Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Text(
                "Tag",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
          subtitle: Container(child: gridtags(context, _tagsList))),
    );
  }

  Widget getColor(BuildContext context) {
    return ResponsiveGridList(
      horizontalGridSpacing: 10, // Horizontal space between grid items
      verticalGridSpacing: 10, // Vertical space between grid items
      horizontalGridMargin: 1, // Horizontal space around the grid
      verticalGridMargin: 20, // Vertical space around the grid
      minItemWidth:
          30, // The minimum item width (can be smaller, if the layout constraints are smaller)
      minItemsPerRow:
          1, // The minimum items to show in a single row. Takes precedence over minItemWidth
      maxItemsPerRow:
          10, // The maximum items to show in a single row. Can be useful on large screens
      listViewBuilderOptions: ListViewBuilderOptions(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
      ), // Options that are getting passed to the ListView.builder() function
      children: ([
        col(Color(0xffb74093)),
        col(Color(0xFFFFFFFF)),
        col(Color(0xFFFFFFFF)),
        col(Color(0xFFFFFFFF)),
        col(Color(0xFFFFFFFF)),
        col(Color(0xFFF44336)),
        col(Color.fromARGB(255, 186, 39, 29)),
        col(Color.fromARGB(255, 90, 10, 4)),
        col(Color.fromARGB(255, 117, 51, 129)),
        col(Color.fromARGB(255, 194, 178, 184)),
        col(Color.fromARGB(255, 188, 156, 17)),
        col(Color.fromARGB(255, 12, 152, 150)),
        col(Color.fromARGB(255, 54, 235, 244)),
        col(Color.fromARGB(255, 40, 16, 162)),
        col(Color.fromARGB(255, 227, 44, 15)),
      ]), // The list of widgets in the list
    );
  }

  Widget gc(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 0),
      child: ListTile(
          title: Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Text(
                "Colour",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
          subtitle: Container(child: getColor(context))),
    );
  }

  Widget getButton(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: () {
              setState(() {
                isStillDefault = !isStillDefault!;
              });
            },
            child: const Text("Make/Unmake default caller ID",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    //print('i m building');
    isStillDefault = widget.isDefaultCallerId;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 40, 38, 38),
          title: const Text('ASSIGN A TAG',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              )),
          actions: [
            TextButton(
                onPressed: isTag == ".." ? () => {} : () => {print("hello")},
                child: Text(
                  "Done",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isTag == ".." ? Colors.grey[400] : Colors.white,
                    fontWeight: isTag == ".." ? null : FontWeight.bold,
                    fontSize: 16,
                  ),
                )),
          ],
        ),
        body: Container(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          color: Colors.black,
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: ((context, index) => Container(
                  color: Colors.black,
                  child: Column(
                    children: [
                      _getCard(context),
                      gt(context),
                      gc(context),
                      /* Container(
                child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                  child: FittedBox(
                      fit: BoxFit.fill,
                      child: const Text(
                        "abcdefghijklmnopqrstuvwx",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                  child: FittedBox(
                      fit: BoxFit.fill,
                      child: const Text(
                        "abcdefghijklmnopqrstuvwx",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                  child: FittedBox(
                      fit: BoxFit.fill,
                      child: const Text(
                        "abcdefghijklmnopqrstuvwx",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                  child: FittedBox(
                      fit: BoxFit.fill,
                      child: const Text(
                        "abcdefghijklmnopqrstuvwx",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )),
                )
              ],
            ))*/
                    ],
                  ),
                )),
          ),
        ));
  }
}
